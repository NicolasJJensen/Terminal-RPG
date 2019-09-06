# frozen_string_literal: true

require_relative '../Core/menu'
require_relative './levels_menu'
require_relative './controls_menu'

# initializes main menu

MAIN_MENU = MainMenu.new(LEVELS_MENU, CONTROLS_MENU)
