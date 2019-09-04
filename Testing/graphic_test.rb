# frozen_string_literal: true

require 'test/unit'
require_relative '../Core/graphic'

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
  end

  def test_color_initalized
    assert_equal(@graphic.color, 7)
  end

  def test_graphic_initalized
    assert_equal(@graphic.graphic, "****\n*  *\n*  *\n****")
  end

  def test_width
    assert_equal(@graphic.width, 4)
  end

  def test_height
    assert_equal(@graphic.height, 4)
  end
end
