# frozen_string_literal: true

require 'curses'
require_relative '../Menus/controls_menu'

# Class containing logic and all information pertaining to a game level
class Level
  attr_accessor :name
  def initialize(name)
    @name = name
    @game_over = false
    menu_setup
  end

  def menu_setup
    @menu = GameMenu.new(CONTROLS_MENU, exit_level)
  end

  def run(win)
    @win = win
    @start_time = Time.now
    until game_over
      update_objects
      move_objects
      collision_logic
      draw
      frame_rate_logic
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
  end

  def draw_attack
  end

  def update_objects
    update_characters
    update_attacks
  end

  def update_characters
  end

  def update_attacks
  end

  def move_objects
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

class RandomLevel < Level
  def initialize
  end
end

class CustomLevel < Level
  def initialize
  end
end