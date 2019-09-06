# frozen_string_literal: true

require 'test/unit'
require_relative '../Core/vector'
require_relative '../Core/raw_graphic'
require_relative '../Core/sprite'
require_relative '../Core/animation'
require_relative '../Core/game_object'

# Tests for the Game class
class GameObjectTest < Test::Unit::TestCase
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
    @game_object = GameObject.new(@animation, Vector.new(:x => 2, :y => 3))
  end

  def test_animation_initalized
    assert_equal(@game_object.animation, @animation)
  end

  def test_pos_initalized
    assert_equal(@game_object.pos, Vector.new(:x => 2, :y => 3))
  end

  def test_pos_updating
    @game_object.move(Vector.new(:x => 2, :y => 4))
    assert_equal(@game_object.pos, Vector.new(:x => 4, :y => 7))
    assert_equal(@game_object.old, Vector.new(:x => 2, :y => 3))
  end

  def test_width
    assert_equal(@game_object.width, 8)
  end

  def test_height
    assert_equal(@game_object.height, 10)
  end

  def test_collision_true
    game_object2 = GameObject.new(@animation, Vector.new(:x => 4, :y => 5))
    assert(@game_object.collides?(game_object2))
    assert(game_object2.collides?(@game_object))
  end

  def test_collision_false
    game_object2 = GameObject.new(@animation, Vector.new(:x => 15, :y => 15))
    assert(!@game_object.collides?(game_object2))
    assert(!game_object2.collides?(@game_object))
  end
end
