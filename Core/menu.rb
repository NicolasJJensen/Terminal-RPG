# frozen_string_literal: true

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
    max_length = @options.map(&:length).max
    @win.setpos(0, 0)
    @win.addstr(' ' + @title)
    @win.setpos(1, 0)
    @win.addstr(' ' + '-' * max_length)

    @options.map.with_index do |option, i|
      @win.setpos(i + 2, 0)
      arrow = ' '
      if i == @current_index
        # set_color
        arrow = '>'
      end
      @win.addstr("#{arrow}#{option}\n")
    end.join("\n")
  end

  def current_option
    @options[@current_index]
  end

  def run
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
  def initialize(window)
    @control_menu = ControlMenu.new(window, [])
    @level_menu = LevelMenu.new(window, [])

    super(%w[Start Controls Help About Exit], 'Main Menu', window)
  end

  def do_option()
    option = @options[@current_index]
    case option
    when 'Start'
      @display_menu = false
    when 'Controls'
      @control_menu.run
    when 'Help'
      show_help
    when 'About'
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
      @exit
    end
  end
end

class LevelMenu < Menu
  def initialize(window, levels)
    @levels = levels
    super([*levels.map(&:name), 'Back'], 'Level Select', window)
  end

  def do_option(option)
    if option == 'Back'
      @display_menu = false
    else
      selected_level = @levels.find { |level| level.name == option }
      selected_level.run
    end
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
      control_index = @controls.find_index_by { |control| control[:index] == option }
      change_control(control_index)
    end
  end

  def change_control(index)
    new_control = @win.getch
    @selected_control = @controls.find { |control| control[:index] == new_control }
    @selected_control[:control] = nil
    @controls[index] = new_control
  end
end
