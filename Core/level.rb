# frozen_string_literal: true

require 'curses'
require_relative '../Menus/controls_menu'
require_relative './Helpers/build_maze'
require_relative './Colors/character'
require_relative './Colors/terrain'
require_relative './GameObjects/Player/player'
require_relative './GameObjects/Terrain/grass'

# Class containing logic and all information pertaining to a game level
class Level
  attr_accessor :name

  def initialize(name)
    @frame_rate = 30.0

    wall = GameObject.new(RawGraphic.new(".*.\n*.*\n.*.", HEDGE), Vector.new(:x => 0, :y => 0))
    @maze_width = 5
    @maze_height = 5
    @maze_cell_size = 40
    @terrain = build_maze(@maze_width, @maze_height, wall, @maze_cell_size)

    @name = name
    @game_over = false

    @local_position = Vector.new(:x => 0, :y => 0)
    @player = Player.new(Vector.new(:x => 4, :y => 4))
    @player_width = @player.width
    @player_height = @player.height

    @characters = []
    @attacks = []

    @menu = GameMenu.new(CONTROLS_MENU, exit_level)
    @hud = RawGraphic.new('|' * (@player.health / 10), HEALTH_BAR)
    @hud_text = RawGraphic.new('HEALTH: ', HEALTH_TEXT)
  end

  def init_floor
    (@maze_width*@maze_cell_size/8).times.map do |x|
      (@maze_width*@maze_cell_size/5).times.map do |y|
        grass = Grass.new(Vector.new(:x => x*8, :y => y*5))
        grass.animation.current_sprite_index = x + y/2 + rand(4)
        grass
      end
    end.flatten
  end

  def run(win)
    @win = win
    @floor = init_floor
    @win.nodelay = true

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
    end
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
    @win.bkgd(Curses.color_pair(WHITE_BKG))
    draw_terrain
    draw_characters
    draw_attack
    draw_health
    @win.refresh
  end

  def draw_terrain
    @floor.each do |tile|
      draw_pos = tile.pos - @local_position + Vector.new(:x => 10, :y => 10)
      next if draw_pos.x.negative? ||
              draw_pos.y.negative? ||
              draw_pos.x - 20 >= @win.maxx ||
              draw_pos.y - 20 >= @win.maxy

      tile.draw(@win, @local_position * -1)
    end

    @terrain.each do |tile|
      draw_pos = tile.pos - @local_position + Vector.new(:x => 10, :y => 10)
      next if draw_pos.x.negative? ||
              draw_pos.y.negative? ||
              draw_pos.x - 20 >= @win.maxx ||
              draw_pos.y - 20 >= @win.maxy

      tile.draw(@win, @local_position * -1)
    end
  end

  def draw_characters
    @player.draw(@win, @local_position * -1)
  end

  def draw_attack
  end

  def draw_health
    @hud.draw(@win, Vector.new(:x => 8, :y => 0))
    @hud_text.draw(@win, Vector.new(:x => 0, :y => 0))
  end

  def update
    update_characters
    update_attacks
    update_hud
    update_local_pos
  end

  def update_local_pos
    pos = @player.pos - Vector.new(:x => @win.maxx/2, :y => @win.maxy/2) - Vector.new(:x => @player_width/2, :y => @player_height/2)
    @local_position = Vector.new(
      :x => pos.x.clamp(0, @maze_width * @maze_cell_size - @win.maxx),
      :y => pos.y.clamp(0, @maze_height * @maze_cell_size - @win.maxy)
    )
  end

  def update_hud
    @hud.graphic = '|' * (@player.health / 10)
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
