# frozen_string_literal: true

require 'test/unit'
require_relative '../Core/game'

# Tests for the Game class
class GameTest < Test::Unit::TestCase
  def setup
    @game = Game.new()
  end

  def test_window_exists
    assert_equal(!!@game.window, true)
  end
end
