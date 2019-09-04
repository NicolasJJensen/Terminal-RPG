# frozen_string_literal: true

require 'test/unit'
require_relative '../Core/vector'
require_relative '../Core/shape'

# Tests for the Game class
class LineTest < Test::Unit::TestCase
  def setup
    @line = Line.new(Vector.new(:x => 5, :y => 5), Vector.new(:x => 0, :y => 0), '*', 5)
  end

  def test_char_initialized
    assert_equal(@line.char, '*')
  end

  def test_color_initialized
    assert_equal(@line.color, 5)
  end

  def test_gradient_initialized
    assert_equal(@line.gradient, 1)
  end

  def test_pos1_initialized
    assert_equal(@line.pos1, Vector.new(:x => 0, :y => 0))
  end

  def test_pos2_initialized
    assert_equal(@line.pos2, Vector.new(:x => 5, :y => 5))
  end
end
