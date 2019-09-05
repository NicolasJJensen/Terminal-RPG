# frozen_string_literal: true

require 'curses'
require_relative '../Menus/controls_menu'
require_relative './GameObjects/Player/player'

# Class containing logic and all information pertaining to a game level
class Level
  attr_accessor :name
  def initialize(name)
    @name = name
    @game_over = false
    @player = Player.new(Vector.new(:x => 0, :y => 0))
    @characters = []
    @attacks = []
    @floor = []
    @terrain = []
    @menu = GameMenu.new(CONTROLS_MENU, exit_level)
    @frame_rate = 60
  end

  def run(win)
    @win = win
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
    sleep_time = 1 / @frame_rate - delta_time
    sleep(sleep_time >= 0 ? sleep_time : 0)
    @start_time = Time.now
  end

  def draw
    @win.erase
    draw_terrain
    draw_characters
    draw_attack
    @win.refresh
  end

  def draw_terrain
  end

  def draw_characters
    @player.draw(@win)
  end

  def draw_attack
  end

  def update
    update_characters
    update_attacks
  end

  def update_characters
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
