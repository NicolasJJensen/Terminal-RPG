# frozen_string_literal: true

require 'curses'
require_relative './Colors/menu'
require_relative './Helpers/paint_color'
require_relative './Helpers/controls'

# Base class for menu control
class Menu
  attr_reader :title, :options
  attr_accessor :current_index

  @@controls = CONTROLS

  def initialize(items, title)
    @title = title
    @options = items

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

  def run(window)
    @win = window
    @win.nodelay = false

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
    when @@controls[0][:control] # Up control - Curses::KEY_UP
      @current_index = (@current_index - 1) % @options.length
    when @@controls[1][:control] # Down control - Curses::KEY_DOWN
      @current_index = (@current_index + 1) % @options.length
    when @@controls[4][:control] # Enter control - Curses::KEY_ENTER, 10
      do_option()
    end
  end

  class << self
    def set_controls(controls)
      @@controls = controls
    end

    def get_controls
      @@controls
    end
  end
end

class MainMenu < Menu
  def initialize(level_menu, control_menu)
    @level_menu = level_menu
    @control_menu = control_menu

    super(%w[Start_Game Controls Help More_Info Exit], 'Main Menu')
  end

  def do_option()
    option = @options[@current_index]
    case option
    when 'Start_Game'
      @level_menu.run(@win)
    when 'Controls'
      @control_menu.run(@win)
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
  def initialize(control_menu, exit_proc)
    @exit = exit_proc

    @control_menu = control_menu

    super(%w[Continue Controls Help MainMenu], 'Game Menu')
  end

  def do_option()
    option = @options[@current_index]
    case option
    when 'Continue'
      @display_menu = false
    when 'Controls'
      @control_menu.run(@win)
    when 'Help'
      @help_menu.run(@win)
    when 'MainMenu'
      @display_menu = false
      @exit.call()
    end
  end
end

class LevelMenu < Menu
  def initialize(levels)
    @levels = levels

    super([*levels.map(&:name), 'Back'], 'Level Select')
  end

  def do_option()
    option = @options[@current_index]
    @display_menu = false
    return if option == 'Back'

    selected_level = @levels.find { |level| level.name == option }
    selected_level.run(@win)
  end
end

class ControlMenu < Menu
  def initialize(controls)
    @controls = controls
    control_names = controls.map do |control|
      control[:name]
    end
    super([*control_names, 'Back'], 'Controls')
  end

  def do_option()
    option = @options[@current_index]
    if option == 'Back'
      @display_menu = false
    else
      control_index = @controls.find_index { |control| control[:name] == option }
      change_control(control_index)
    end
  end

  def change_control(index)
    new_control = @win.getch
    @controls[index][:control] = new_control
    @@controls = @controls
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

    options_max = @options.max_by(&:length).length
    key_max = @controls.map { |control| control_to_string(control[:control]) }.max_by(&:length).length
    left = @win.maxx / 2 - (options_max + key_max + 10) / 2

    @options[0...-1].each.with_index do |option, i|
      color = TEXT
      color = TEXT_SUCCESS if i == @current_index

      control = control_to_string(@controls[i][:control])

      paint(@win, color) do
        option_text = "#{i == @current_index ? 'ᐅ ' : '  '}#{option}"

        @win.setpos(y + i + 2, left)
        @win.addstr(option_text + (' ' * ((options_max + key_max + 10) - option_text.length - control.length)) + control)
      end
    end

    option_text = "#{@current_index == @options.length - 1 ? 'ᐅ ' : '  '}#{@options[-1]}"
    color = @current_index == @options.length - 1 ? TEXT_SUCCESS : TEXT_WARNING

    x = @win.maxx / 2 - @options[-1].length / 2
    @win.setpos(y + @options.length + 2, x)
    paint(@win, color) do
      @win.addstr(option_text)
    end
  end

  def control_to_string(control)
    return control if control.class == String

    case control
    when 259
      'Up Key'
    when 258
      'Down Key'
    when 260
      'Left Key'
    when 261
      'Right key'
    when 10
      'Enter Key'
    end
  end
end
