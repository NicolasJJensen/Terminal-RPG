# frozen_string_literal: true

require 'test/unit'
require_relative '../Core/vector'
require_relative '../Core/raw_graphic'
require_relative '../Core/sprite'
require_relative '../Core/animation'

# Tests for the Game class
class GraphicTest < Test::Unit::TestCase
  def setup
    graphic = "
****
*  *
*  *
****
"
    @graphic = RawGraphic.new(graphic, 7)
    @sprite = Sprite.new([@graphic], [Vector.new(:x => 2, :y => 3)])
    @animation = Animation.new([@sprite], [Vector.new(:x => 2, :y => 3)], 60)
  end

  def test_sprites_initalized
    assert_equal(@animation.sprites, [@sprite])
  end

  def test_sprite_positions_initalized
    assert_equal(@animation.sprite_positions, [Vector.new(:x => 2, :y => 3)])
  end

  def test_current_index_initalized
    assert_equal(@animation.current_sprite_index, 0)
  end

  def test_current_sprite
    assert_equal(@animation.current_sprite, @sprite)
  end

  def test_fps_initalized
    assert_equal(@animation.fps, 60)
  end

  def test_width
    assert_equal(@animation.width, 8)
  end

  def test_height
    assert_equal(@animation.height, 10)
  end

  def test_fps_class_var_working
    assert_equal(Animation.get_frame_rate, 30)
    Animation.set_frame_rate(60)
    assert_equal(Animation.get_frame_rate, 60)
  end
end
