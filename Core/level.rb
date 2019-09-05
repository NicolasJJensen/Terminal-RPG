# frozen_string_literal: true

require 'curses'
require 'artii'
require_relative '../Menus/controls_menu'
require_relative './Helpers/build_maze'
require_relative './Helpers/hud'
require_relative './Colors/character'
require_relative './Colors/terrain'
require_relative './GameObjects/Player/player'

# Class containing logic and all information pertaining to a game level
class Level
  attr_accessor :name

  def initialize(name, wall, floor, width, height, player)
    @frame_rate = 30.0
    @maze_width = width
    @maze_height = height
    @maze_cell_size = 40
    @terrain = build_maze(@maze_width, @maze_height, wall, @maze_cell_size)
    @floor_type = floor

    @name = name
    @game_over = false

    @characters = []
    @attacks = []
    @temp_objects = []

    @local_position = Vector.new(:x => 0, :y => 0)
    @player = player
    @player.creation_proc = creation_proc
    @player_width = @player.width
    @player_height = @player.height

    @menu = GameMenu.new(CONTROLS_MENU, exit_level)
  end

  def init_floor
    (@maze_width*@maze_cell_size/8).times.map do |x|
      (@maze_width*@maze_cell_size/5).times.map do |y|
        floor = @floor_type.copy
        floor.pos = Vector.new(:x => x*8, :y => y*5)
        floor.animation.current_sprite_index = x + y + rand(5)
        floor
      end
    end.flatten
  end

  def run(win)
    @win = win
    @floor = init_floor
    @win.nodelay = true
    @game_over = false

    @start_time = Time.now
    until @game_over
      input_logic
      update
      move
      collision_logic
      draw
      frame_rate_logic
    end
  end

  def input_logic
    case @win.getch
    when ControlMenu.get_controls[0][:control] # UP
      @player.move(Vector.new(:x => 0, :y => -1))
    when ControlMenu.get_controls[1][:control] # DOWN
      @player.move(Vector.new(:x => 0, :y => 1))
    when ControlMenu.get_controls[2][:control] # LEFT
      @player.move(Vector.new(:x => -1, :y => 0))
    when ControlMenu.get_controls[3][:control] # RIGHT
      @player.move(Vector.new(:x => 1, :y => 0))
    when 'p'
      @menu.run(@win)
    end
  end

  def clear_temp_objects
    @temp_objects = @temp_objects.map do |object|
      if object.finish
        nil
      else
        object
      end
    end.compact
  end

  def creation_proc
    proc { |object| @temp_objects << object }
  end

  def frame_rate_logic
    @finish_time = Time.now
    delta_time = @finish_time - @start_time
    sleep_time = 1.0 / @frame_rate - delta_time
    sleep(sleep_time >= 0 ? sleep_time : 0)
    @start_time = Time.now
  end

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

  def draw_temp_objects
    @temp_objects.each do |object|
      object.draw(@win, @local_position * -1)
    end
  end

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

  def draw_characters
    @player.draw(@win, @local_position * -1)
  end

  def draw_attack
  end

  def draw_health
    get_hud(@player.health / 100.0).draw(@win, Vector.new(:x => 0, :y => 0))
  end

  def update
    update_characters
    update_attacks
    update_local_pos
    clear_temp_objects
    update_temp_objects
  end

  def update_temp_objects
    @temp_objects.each(&:update)
  end

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

  def update_characters
    @player.update
  end

  def update_attacks
  end

  def move
    move_characters
    move_attacks
  end

  def move_characters
  end

  def move_attacks
  end

  def collision_logic
    terrain_collision
    character_collision
    attack_collision
    check_out_of_bounds
  end

  def display_win
    @win.clear
    str = Artii::Base.new.asciify("YOU WON")
    str.split("\n").each.with_index do |line, i|
      @win.setpos(i, 0)
      line.chars.each do |char|
        @win.addch(char)
      end
    end
    @win.refresh
    sleep(1)
    sleep(1)
  end

  def check_out_of_bounds
    if @player.pos.x.negative?
      @player.pos = Vector.new(:x => 6, :y => 6)
      @player.velocity = Vector.new(:x => 0, :y => 0)
      @game_over = true
    elsif (@player.pos.x + @player.width - @local_position.x) >= @win.maxx
      display_win
      @player.pos = Vector.new(:x => 6, :y => 6)
      @player.velocity = Vector.new(:x => 0, :y => 0)
      @game_over = true
    end
  end

  def terrain_collision
    @terrain.each do |wall|
      draw_pos = wall.pos - @local_position + Vector.new(:x => 10, :y => 10)
      next if draw_pos.x.negative? ||
              draw_pos.y.negative? ||
              draw_pos.x - 20 >= @win.maxx ||
              draw_pos.y - 20 >= @win.maxy ||
              !@player.collides?(wall)

      @player.pos = @player.old
      break
    end
  end

  def character_collision
  end

  def attack_collision
  end

  private

  def exit_level
    proc { @game_over = true }
  end
end
