# frozen_string_literal: true

require 'test/unit'
require_relative '../Core/vector'

# Tests for the Game class
class VectorTest < Test::Unit::TestCase
  def setup
    @vector = Vector.new(:x => 3, :y => 4)
  end

  def test_values_initialized
    assert_equal(@vector.x, 3)
    assert_equal(@vector.y, 4)
  end

  def test_values_initialized_with_scalar
    vector = Vector.new(:scalar => 1, :angle => 90)
    assert_equal(vector.x.round(5), 0)
    assert_equal(vector.y.round(5), 1)
  end

  def test_scalar
    assert_equal(@vector.scalar, 5)
  end

  def test_distance_sqr
    vector = Vector.new(:x => 0, :y => 0)
    distance = @vector.distance_sqr(vector)
    assert_equal(distance, 25)
  end

  def test_distance
    vector = Vector.new(:x => 0, :y => 0)
    distance = @vector.distance(vector)
    assert_equal(distance, 5)
  end

  def test_multiply_constant
    vector = @vector * 5
    assert_equal(vector.x, 15, 20)
  end

  def test_divide_constant
    vector = @vector / 2
    assert_equal(vector.x, 1.5, 2)
  end

  def test_subtract_vectors
    vector = Vector.new(:x => 2, :y => 1)
    vector_diff = @vector - vector
    assert_equal(vector_diff.x, 1)
    assert_equal(vector_diff.y, 3)
  end

  def test_add_vectors
    vector = Vector.new(:x => 2, :y => 1)
    vector_combine = @vector + vector
    assert_equal(vector_combine.x, 5)
    assert_equal(vector_combine.y, 5)
  end

  def test_normalized
    normalized = @vector.normalized
    assert_equal(normalized.x.round(5), 0.6)
    assert_equal(normalized.y.round(5), 0.8)
  end

  def test_gradient
    gradient = @vector.gradient
    assert_equal(gradient, 4 / 3.0)
  end
end
