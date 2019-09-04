# frozen_string_literal: true

require 'test/unit'
require_relative '../Core/shape'

# Tests for the Game class
class ShapeTest < Test::Unit::TestCase
  def setup
    @shape = Shape.new('*', 5)
  end

  def test_char_initialized
    assert_equal(@shape.char, '*')
  end

  def test_color_initialized
    assert_equal(@shape.color, 5)
  end
end
