# frozen_string_literal: true

require 'test/unit'
require_relative '../Core/vector'
require_relative '../Core/shape'

# Tests for the Game class
class NSidedShapeTest < Test::Unit::TestCase
  def setup
    @shape = NSidedShape.new(3, 4, 1, '*', 5, 30)
  end

  def test_char_initialized
    assert_equal(@shape.char, '*')
  end

  def test_color_initialized
    assert_equal(@shape.color, 5)
  end

  def test_radius_initialized
    assert_equal(@shape.radius, 3)
  end

  def test_sides_initialized
    assert_equal(@shape.sides, 4)
  end

  def test_line_width_initialized
    assert_equal(@shape.line_width, 1)
  end

  def test_angle_initialized
    assert_equal(@shape.angle, 30)
  end

  def test_default_angle_initialized
    shape = NSidedShape.new(3, 4, 1, '*', 5)
    assert_equal(shape.angle, 0)
  end

  def test_points_initialized
    assert_equal(@shape.points.length, 4)
  end

  def test_lines_initialized
    assert_equal(@shape.lines.length, 4)
  end
end
