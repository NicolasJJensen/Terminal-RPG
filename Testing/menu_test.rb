# frozen_string_literal: true

require 'test/unit'
require_relative '../Core/menu'

# Tests for the Game class
class MenuTest < Test::Unit::TestCase
  def setup
    @menu = Menu.new(%w[Start Exit], 'Normal')
  end

  def test_options_initialized
    setup
    assert_equal(@menu.options, %w[Start Exit])
  end

  def test_title_initialized
    setup
    assert_equal(@menu.title, 'Normal')
  end

  def test_index_initialized
    setup
    assert_equal(@menu.current_index, 0)
  end

  def test_correct_option
    setup
    assert_equal(@menu.current_option, 'Start')
  end
end
