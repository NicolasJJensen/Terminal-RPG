# frozen_string_literal: true

require_relative '../character'
require_relative './player_animations'
require_relative '../../vector'

# Class for the player character and all their interactions
class Player < Character
  attr_accessor :creation_proc

  def initialize(pos, effect = nil, e_cooldown = nil, creation_proc = nil)
    super(PLAYER_DOWN, pos, 80, nil)
    @velocity = Vector.new(:x => 0, :y => 0)
    @move = 0
    @effect = effect
    @e_cooldown = e_cooldown
    @e_current_cd = 0
    @creation_proc = creation_proc
  end

  def update
    if @move.positive?
      animation.freeze = false
      @old = @pos
      @pos += @velocity
      @move -= 1
      do_create
    else
      animation.current_sprite_index = 0
      animation.freeze = true
    end
    update_animation
  end

  def do_create
    @e_current_cd -= 1
    return unless @effect && @e_cooldown && creation_proc && @e_current_cd.negative?

    @e_current_cd = @e_cooldown
    new_effect = @effect.copy
    new_effect.pos = @pos + Vector.new(:x => width/2, :y => height - 1)
    creation_proc.call(new_effect)
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
