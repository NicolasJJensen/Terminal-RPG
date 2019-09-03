# frozen_string_literal: true

require 'curses'

# Class containing logic and all information pertaining to a game
class Game
  attr_reader :window

  def initialize(window)
    @window = window
    @game_over = false
    @menu = GameMenu.new(@window, exit_game)
  end

  private

  def window_setup
    Curses.init_screen
    Curses.start_color
    Curses.curs_set(0)
    Curses.noecho
    win = Curses::Window.new(0, 0, 0, 0)
    win.nodelay = true
    win.keypad = true
    return win
  end

  def exit_game
    proc { @game_over = true }
  end
end
