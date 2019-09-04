# frozen_string_literal: true

require 'test/unit'
require_relative '../Core/shape'

# Tests for the Game class
class CircleTest < Test::Unit::TestCase
  def setup
    @circle = Circle.new(5, 1, '*', 5)
  end

  def test_char_initialized
    assert_equal(@circle.char, '*')
  end

  def test_color_initialized
    assert_equal(@circle.color, 5)
  end

  def test_radius_initialized
    assert_equal(@circle.radius, 5)
  end

  def test_line_width_initialized
    assert_equal(@circle.line_width, 1)
  end
end
