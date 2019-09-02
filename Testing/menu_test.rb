# frozen_string_literal: true

require 'test/unit'
require_relative '../Core/menu'

# Tests for the Game class
class MenuTest < Test::Unit::TestCase
  def setup
    @menu = Menu.new(%w[Start Controls Help About Exit])
  end

  def test_layout_initialized
    setup
    assert_equal(@menu.menu, %w[Start Controls Help About Exit])
  end
end
