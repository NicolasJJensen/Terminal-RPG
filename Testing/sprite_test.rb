# frozen_string_literal: true

require 'test/unit'
require_relative '../Core/vector'
require_relative '../Core/graphic'
require_relative '../Core/sprite'

# Tests for the Game class
class GraphicTest < Test::Unit::TestCase
  def setup
    graphic = "
****
*  *
*  *
****
"
    @graphic = Graphic.new(graphic, 7)
    @sprite = Sprite.new([@graphic], [Vector.new(:x => 2, :y => 3)])
  end

  def test_graphic_initalized
    assert_equal(@sprite.graphics[0].graphic, "****\n*  *\n*  *\n****")
  end

  def test_width
    assert_equal(@sprite.width, 6)
  end

  def test_height
    assert_equal(@sprite.height, 7)
  end
end