# frozen_string_literal: true

require_relative '../character'
require_relative './player_animations'
require_relative '../../vector'

# Class for the player character and all their interactions
class Player < Character
  def initialize(pos)
    super(PLAYER_DOWN, pos, 100, nil)
    @velocity = Vector.new(:x => 0, :y => 0)
    @move = 0
  end

  def update
    if @move.positive?
      animation.freeze = false
      @old = @pos
      @pos += @velocity
      @move -= 1
    else
      animation.current_sprite_index = 0
      animation.freeze = true
    end
    update_animation
  end

  def update_animation
    case @velocity
    when Vector.new(:x => 0, :y => 1)
      @animation = PLAYER_DOWN
    when Vector.new(:x => 0, :y => -1)
      @animation = PLAYER_UP
    when Vector.new(:x => -1, :y => 0)
      @animation = PLAYER_LEFT
    when Vector.new(:x => 1, :y => 0)
      @animation = PLAYER_RIGHT
    end
  end

  def move(velocity)
    @velocity = velocity
    @move = 25
  end
end
