# frozen_string_literal: true

require 'curses'
require_relative './Colors/menu'
require_relative './Helpers/paint_color'

# Base class for menu control
class Menu
  attr_reader :title, :options
  attr_accessor :current_index

  def initialize(items, title, window)
    @title = title
    @options = items

    @win = window
    @win.nodelay = false if @win

    @current_index = 0
    @display_menu = true
  end

  def draw
    @win.bkgd(Curses.color_pair(BACKGROUND))
    @win.attron(Curses.color_pair(TEXT))
    x = @win.maxx / 2 - @title.length / 2
    y = @win.maxy / 2 - @options.length / 2

    @win.setpos(y, x)
    @win.addstr(@title)
    @win.setpos(y + 1, x)
    @win.addstr('-' * @title.length)

    @options.each.with_index do |option, i|
      color = TEXT
      color = TEXT_WARNING if i == @options.length - 1
      color = TEXT_SUCCESS if i == @current_index

      paint(@win, color) do
        option_text = "#{i == @current_index ? 'ᐅ ' : ''}#{option}#{i == @current_index ? ' ᐊ' : ''}"
        x = @win.maxx / 2 - option_text.length / 2

        @win.setpos(y + i + 2, x)
        @win.addstr(option_text)
      end
    end.join("\n")
  end

  def current_option
    @options[@current_index]
  end

  def run
    @display_menu = true
    while @display_menu
      @win.clear
      draw()
      @win.refresh
      do_input()
    end
  end

  def do_input
    user_input = @win.getch
    case user_input
    when Curses::KEY_UP
      @current_index = (@current_index - 1) % @options.length
    when Curses::KEY_DOWN
      @current_index = (@current_index + 1) % @options.length
    when Curses::KEY_ENTER, 10
      do_option()
    end
  end
end

class MainMenu < Menu
  def initialize(window, level_menu, control_menu)
    @level_menu = level_menu
    @control_menu = control_menu

    super(%w[Start_Game Controls Help More_Info Exit], 'Main Menu', window)
  end

  def do_option()
    option = @options[@current_index]
    case option
    when 'Start_Game'
      @level_menu.run
    when 'Controls'
      @control_menu.run
    when 'Help'
      show_help
    when 'More_Info'
      show_about
    when 'Exit'
      @display_menu = false
      exit
    end
  end

  def show_about
    @win.addstr('Press any key to return')
    @win.getch
  end

  def show_help
    @win.addstr('Press any key to return')
    @win.getch
  end
end

class GameMenu < Menu
  def initialize(window, exit_proc)
    @exit = exit_proc

    @control_menu = ControlMenu.new(window, [])

    super(%w[Continue Controls Help MainMenu], 'Game Menu', window)
  end

  def do_option()
    option = @options[@current_index]
    case option
    when 'Continue'
      @display_menu = false
    when 'Controls'
      @control_menu.run
    when 'Help'
      @help_menu.run
    when 'MainMenu'
      @display_menu = false
      @exit.call()
    end
  end
end

class LevelMenu < Menu
  def initialize(window, levels)
    @levels = levels

    super([*levels.map(&:name), 'Back'], 'Level Select', window)
  end

  def do_option()
    option = @options[@current_index]
    @display_menu = false
    return if option == 'Back'

    selected_level = @levels.find { |level| level.name == option }
    selected_level.run
  end
end

class ControlMenu < Menu
  def initialize(window, controls)
    @controls = controls
    super([*controls.map(&:name), 'Back'], 'Controls', window)
  end

  def do_option()
    option = @options[@current_index]
    if option == 'Back'
      @display_menu = false
    else
      control_index = @controls.find_index_by { |control| control[:name] == option }
      change_control(control_index)
    end
  end

  def change_control(index)
    new_control = @win.getch
    @selected_control = @controls.find { |control| control[:index] == new_control }
    @selected_control[:control] = nil
    @controls[index][:control] = new_control
  end
end
