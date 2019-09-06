# frozen_string_literal: true

require 'test/unit'
require_relative '../Core/menu'

# Tests for the Game class
class MenuTest < Test::Unit::TestCase
  def setup
    @menu = Menu.new(%w[Start Exit], 'Normal')
  end

  def test_options_initialized
    assert_equal(@menu.options, %w[Start Exit])
  end

  def test_title_initialized
    assert_equal(@menu.title, 'Normal')
  end

  def test_index_initialized
    assert_equal(@menu.current_index, 0)
  end

  def test_correct_option
    assert_equal(@menu.current_option, 'Start')
  end

  def test_main_menu_initializes
    menu = MainMenu.new(nil, nil)
    assert_equal(menu.title, 'Main Menu')
    assert_equal(menu.options, ['Start Game', 'Controls', 'Help', 'More Info', 'Exit'])
  end

  def test_game_menu_initializes
    menu = GameMenu.new(nil, nil)
    assert_equal(menu.title, 'Game Menu')
    assert_equal(menu.options, ['Continue', 'Controls', 'Help', 'Main Menu'])
  end
end
