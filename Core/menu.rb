# frozen_string_literal: true

require 'curses'
require 'artii'

require_relative './Colors/menu'
require_relative './raw_graphic'
require_relative './vector'

require_relative './Helpers/paint_color'
require_relative './Helpers/controls'

# Base class for menu control
class Menu
  attr_reader :title, :options
  attr_accessor :current_index

  # this is a class variable so all menus can access the controls
  @@controls = CONTROLS

  # every menu has a title and a list of options
  def initialize(options, title)
    @title = title
    @options = options

    setup_art

    # index of currently selected item
    @current_index = 0

    # variable for menu loop
    @display_menu = true
  end

  # this function converts all the options to
  # artii strings then puts those into graphics for
  # prettier and bigger menus
  def setup_art
    @art_options = @options.map do |option|
      option_text = option.split(' ').join('  ')

      RawGraphic.new(Artii::Base.new.asciify(option_text))
    end

    title_text = @title.split(' ').map do |word|
      word.chars.map { |letter| letter + ' ' }.join
    end.join('  ')

    @art_title = Artii::Base.new.asciify(title_text)
    @title_graphic = RawGraphic.new(@art_title, TEXT_FAIL)
  end

  # fuction to draw the menu
  def draw
    # sets the background to solid black
    @win.bkgd(Curses.color_pair(BACKGROUND))
    @win.attron(Curses.color_pair(TEXT))

    title_length = @art_title.split("\n").map(&:length).max

    x = @win.maxx / 2 - title_length / 2
    y = @win.maxy / 2 - (@options.length * 10) / 2 - 10

    @title_graphic.draw(@win, Vector.new(x: x, y: y))

    # loops through each options and correctly sets the color
    @art_options.each.with_index do |option_graphic, i|
      color = TEXT
      color = TEXT_WARNING if i == @options.length - 1
      color = TEXT_SUCCESS if i == @current_index

      option_length = option_graphic.graphic.split("\n").map(&:length).max
      x = @win.maxx / 2 - option_length / 2

      # draws the option graphic in the correct location
      option_graphic.draw(@win, Vector.new(x: x, y: (y + i * 10 + 20)), color)
    end
  end

  # returns the current option that is selected in the menu
  def current_option
    @options[@current_index]
  end

  # runs the menu
  def run(window)
    # once again the window is initialized here because the menus
    # are held in their own folders without access to the window naturally
    @win = window

    # sets delay on input to save processing power
    @win.nodelay = false

    @display_menu = true

    # starts the menu loop
    while @display_menu
      @win.erase
      draw
      @win.refresh
      do_input
    end
  end

  # chooses an option based on the users input
  def do_input
    user_input = @win.getch
    case user_input
    when @@controls[0][:control] # Up control - Curses::KEY_UP
      @current_index = (@current_index - 1) % @options.length
    when @@controls[1][:control] # Down control - Curses::KEY_DOWN
      @current_index = (@current_index + 1) % @options.length
    when @@controls[4][:control] # Enter control - Curses::KEY_ENTER, 10
      do_option
    end
  end

  # allows the controls to be access and altered
  class << self
    def set_controls(controls)
      @@controls = controls
    end

    def get_controls
      @@controls
    end
  end
end

# a class for easy initialization of the main menu
class MainMenu < Menu
  def initialize(level_menu, control_menu)
    # main menu contains the controls menu and the level menu
    @level_menu = level_menu
    @control_menu = control_menu

    # main menu always has the same options
    super(['Start Game', 'Controls', 'Help', 'More Info', 'Exit'], 'Main Menu')
  end

  # chooses what to do based on the users selection
  def do_option
    option = @options[@current_index]
    case option
    when 'Start Game'
      @level_menu.run(@win)
    when 'Controls'
      @control_menu.run(@win)
    when 'Help'
      show_help
    when 'More Info'
      show_about
    when 'Exit'
      @display_menu = false
      exit
    end
  end

  # function to show about information
  def show_about
    @win.addstr('Press any key to return')
    @win.getch
  end

  # function to show help information
  def show_help
    @win.addstr('Press any key to return')
    @win.getch
  end
end

# Game Menu class for east initialization
class GameMenu < Menu
  def initialize(control_menu, exit_proc)
    # exit proc so game menu can exit the gameloop
    @exit = exit_proc

    # control menu to edit the controls
    @control_menu = control_menu

    # always initialized with the saem valuess
    super(['Continue', 'Controls', 'Help', 'Main Menu'], 'Game Menu')
  end

  # what to do for each option
  def do_option
    option = @options[@current_index]
    case option
    when 'Continue'
      @display_menu = false
      @win.nodelay = true
    when 'Controls'
      @control_menu.run(@win)
    when 'Help'
      @help_menu.run(@win)
    when 'Main Menu'
      @display_menu = false
      @exit.call
    end
  end
end

# Menu of all the levels
class LevelMenu < Menu
  def initialize(levels)
    @levels = levels

    # uses the levels input and puts their names as options
    super([*levels.map(&:name), 'Back'], 'Level Select')
  end

  # what to do for each selection
  def do_option
    option = @options[@current_index]
    @display_menu = false
    return if option == 'Back'

    selected_level = @levels.find { |level| level.name == option }
    selected_level.run(@win)
  end
end

# control menu
class ControlMenu < Menu
  def initialize(controls)
    @controls = controls
    control_names = controls.map do |control|
      control[:name]
    end
    super([*control_names, 'Back'], 'Controls')
  end

  # what to do for each option
  def do_option
    option = @options[@current_index]
    if option == 'Back'
      @display_menu = false
    else
      control_index = @controls.find_index { |control| control[:name] == option }
      change_control(control_index)
    end
  end

  # function that allows user to change a control at the index specified
  def change_control(index)
    new_control = @win.getch
    @controls[index][:control] = new_control
    @@controls = @controls
  end

  # custom draw function because the controls needs 2 lists
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

  # gets a control and finds what it should be called
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
