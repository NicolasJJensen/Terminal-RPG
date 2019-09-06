# frozen_string_literal: true

require 'curses'
require 'artii'
require_relative '../Menus/controls_menu'
require_relative './Helpers/build_maze'
require_relative './Helpers/hud'
require_relative './Helpers/paint_color'
require_relative './Colors/menu'
require_relative './Colors/character'
require_relative './Colors/terrain'
require_relative './GameObjects/Player/player'

# Class containing logic and all information pertaining to a game level
class Level
  attr_accessor :name

  # allows inititalization of a level with
  # the name of the level
  # the material that the floor is made out of
  # the width and height of the maze
  # and the player instance that will be playing the level
  def initialize(name, wall, floor, width, height, player)

    # setup for the maze
    @frame_rate = 30.0
    @maze_width = width
    @maze_height = height
    @maze_cell_size = 40

    # using the helper function to generate the terrain for the maze
    @terrain = build_maze(@maze_width, @maze_height, wall, @maze_cell_size)

    # setting the floor type to a template instance of the class being used
    @floor_type = floor

    @name = name
    @game_over = false

    # unimplemented features
    @characters = []
    @attacks = []

    # a list of objects that will exist temporarily
    @temp_objects = []

    # local positions variable is so that the game
    # can scroll along with the player by offsetting everything
    @local_position = Vector.new(:x => 0, :y => 0)

    # setup the player and some variables used for creation and drawing
    @player = player
    @player.creation_proc = creation_proc
    @player_width = @player.width
    @player_height = @player.height

    # setup the menu displayed with a "proc" that is used
    # for exiting the game from in the menu
    # by calling a game function (only way I know of to do this with nested values)
    @menu = GameMenu.new(CONTROLS_MENU, exit_level)
  end

  # this function initializes the floor of the maze
  # based on the size of the floor tile and
  # how big the maze is
  def init_floor
    (@maze_width*@maze_cell_size/8).times.map do |x|
      (@maze_width*@maze_cell_size/5).times.map do |y|
        # first a copy of the floor tile is created
        floor = @floor_type.copy
        # it's position is set
        floor.pos = Vector.new(:x => x*8, :y => y*5)
        # it's animation is initialized at a different point
        # depending on it's place and a random value to
        # create and offset so every animation is slightly different
        floor.animation.current_sprite_index = x + y + rand(5)
        floor
      end
    end.flatten
  end

  # this is that main function to run that game level
  def run(win)
    # the window is setup here because the level is created in a seperate file
    # without access to the window it will be printed on
    @win = win

    # initializes the floor when the game is run (should be in initialize?)
    @floor = init_floor

    # sets the loop and curses up to work with framerate
    @win.nodelay = true
    @game_over = false

    # initializes the start time which is used for keeping the FPS constant
    @start_time = Time.now

    # begins the game loop based on @game_over variable
    # so it can be cancelled in multiple ways easily
    until @game_over
      input_logic
      update
      move
      collision_logic
      draw
      frame_rate_logic
    end
  end

  # This function does the corresponding action for each input that can
  # be entered
  def input_logic
    case @win.getch
    when ControlMenu.get_controls[0][:control] # UP
      @player.move(Vector.new(:x => 0, :y => -2))
    when ControlMenu.get_controls[1][:control] # DOWN
      @player.move(Vector.new(:x => 0, :y => 2))
    when ControlMenu.get_controls[2][:control] # LEFT
      @player.move(Vector.new(:x => -2, :y => 0))
    when ControlMenu.get_controls[3][:control] # RIGHT
      @player.move(Vector.new(:x => 2, :y => 0))
    when 'p'
      @menu.run(@win)
    end
  end

  # this function removes any temporary objectes that
  # have been completed, this is done so they dont take up
  # processing power when they no longer need to
  def clear_temp_objects
    @temp_objects = @temp_objects.map do |object|
      if object.finish
        nil
      else
        object
      end
    end.compact
  end

  # This is a "proc"
  # it is used as a parameter so that nested values can
  # create a temporary object that the level will display
  # it allows the logic to stay inside the level class
  # and not split code too heavily
  def creation_proc
    proc { |object| @temp_objects << object }
  end

  # this function checks how long it took to run the iteration of the loop
  # if it was too fast it sleeps for the extra time
  # this keeps the frame rate "locked" at the value specified
  def frame_rate_logic
    @finish_time = Time.now
    delta_time = @finish_time - @start_time
    sleep_time = 1.0 / @frame_rate - delta_time
    sleep(sleep_time >= 0 ? sleep_time : 0)
    @start_time = Time.now
  end

  # this is a master function for everything that needs to be drawn
  def draw
    @win.erase
    draw_floor
    draw_temp_objects
    draw_terrain
    draw_characters
    draw_attack
    draw_health
    @win.refresh
  end

  # this draws the temporary objects
  def draw_temp_objects
    @temp_objects.each do |object|
      object.draw(@win, @local_position * -1)
    end
  end

  # this draws the floor
  # however ONLY if the floor is withing range of sight
  # this saves processing power (definitely needed unless you want to play at 2 FPS)
  # it also offsets the floor by the local position so that the screen follows thr player
  def draw_floor
    @floor.each do |tile|
      draw_pos = tile.pos - @local_position + Vector.new(:x => 10, :y => 10)
      next if draw_pos.x.negative? ||
              draw_pos.y.negative? ||
              draw_pos.x - 30 >= @win.maxx ||
              draw_pos.y - 30 >= @win.maxy

      tile.draw(@win, @local_position * -1)
    end
  end

  # this follows the same logic as the floor
  def draw_terrain
    @terrain.each do |tile|
      draw_pos = tile.pos - @local_position + Vector.new(:x => 10, :y => 10)
      next if draw_pos.x.negative? ||
              draw_pos.y.negative? ||
              draw_pos.x - 30 >= @win.maxx ||
              draw_pos.y - 30 >= @win.maxy

      tile.draw(@win, @local_position * -1)
    end
  end

  # function to draw the characters
  # at the moment the only character is the player
  # also offset to keep the player in the center
  def draw_characters
    @player.draw(@win, @local_position * -1)
  end

  # unimplemented feature
  def draw_attack
  end

  # this uses the hud helper to get the current hud
  # and display it
  def draw_health
    get_hud(@player.health / 100.0).draw(@win, Vector.new(:x => 0, :y => 0))
  end

  # master function to keep track of and call all updates
  def update
    update_characters
    update_attacks
    update_local_pos
    clear_temp_objects
    update_temp_objects
  end

  # this updates the temporary objects
  def update_temp_objects
    @temp_objects.each(&:update)
  end

  # this function gets the player position
  # offsets up and left by half the screen
  # then clamps it to keep it within a range
  # that value is then used to offset every object correctly
  # making the screen follow the player
  def update_local_pos
    pos = @player.pos - Vector.new(:x => @win.maxx/2, :y => @win.maxy/2) - Vector.new(:x => @player_width/2, :y => @player_height/2)
    if 0 < @maze_width * @maze_cell_size - @win.maxx
      x = pos.x.clamp(0, @maze_width * @maze_cell_size - @win.maxx)
    else
      x = 0
    end
    if 0 < @maze_height * @maze_cell_size - @win.maxy
      y = pos.y.clamp(0, @maze_height * @maze_cell_size - @win.maxy)
    else
      y = 0
    end
    @local_position = Vector.new(
      :x => x,
      :y => y
    )
  end

  # this function updates the characters
  # (only the player at the moment)
  def update_characters
    @player.update
  end

  # unimplemented feature
  def update_attacks
  end

  # this is a master function to control moving everything
  def move
    move_characters
    move_attacks
  end

  # moves the characters
  # (player is handled differently)
  def move_characters
  end

  # unimplemented functionality
  def move_attacks
  end

  # this is a master function to keep track of the collision logic
  def collision_logic
    terrain_collision
    character_collision
    attack_collision
    check_out_of_bounds
  end

  # this function is MEANT to display a win screen when the player wins
  # as of now I have 0 clue on why it isn't working
  def display_win
    @win.clear
    paint(@win, TEXT_SUCCESS) do
      str = Artii::Base.new.asciify("YOU WON")
      str.split("\n").each.with_index do |line, i|
        line.chars.each.with_index do |char, j|
          @win.setpos(@win.maxy/2 + i, @win.maxx/2 + j - str.split("\n")[0].length/2)
          @win.addch(char) unless char == ' '
        end
      end
    end
    @win.refresh
    sleep(1)
    sleep(1)
  end

  # this checks is the player has exited to the left or right
  def check_out_of_bounds
    # if the player moves off the left it takes them back to the main menu
    # by exiting the game loop
    # also resets the players position and velocity for next time they enter the level
    if @player.pos.x.negative?
      @player.pos = Vector.new(:x => 6, :y => 6)
      @player.velocity = Vector.new(:x => 0, :y => 0)
      @game_over = true

    # if the player has moved off to the right of the screen
    # displays a screen telling them they have won and resets the level
    elsif (@player.pos.x + @player.width - @local_position.x) >= @win.maxx
      display_win
      @player.pos = Vector.new(:x => 6, :y => 6)
      @player.velocity = Vector.new(:x => 0, :y => 0)
      @game_over = true
    end
  end

  # checks of the player has collided with a piece of terrain
  # BUT only checks the terrain on screen
  # this saves ALOT of computational power
  def terrain_collision
    @terrain.each do |wall|
      draw_pos = wall.pos - @local_position + Vector.new(:x => 10, :y => 10)
      next if draw_pos.x.negative? ||
              draw_pos.y.negative? ||
              draw_pos.x - 20 >= @win.maxx ||
              draw_pos.y - 20 >= @win.maxy ||
              !@player.collides?(wall)

      # if the player did collide move them back to their previous position
      # and dont allow them to move in that direction
      @player.pos = @player.old
      break
    end
  end

  # there are no other characters so this isn't needed
  def character_collision
  end

  # attacks not implemented yet
  def attack_collision
  end

  private

  # this is a proc that cancels the game loop when called
  # it is used so that the Game Menu nested inside the Level
  # can return back to main menu easily (God I love procs)
  # (react has taught me well)
  def exit_level
    proc { @game_over = true }
  end
end
