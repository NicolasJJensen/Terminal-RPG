# frozen_string_literal: true

require_relative '../character'
require_relative './player_animations'
require_relative '../../vector'

# Class for the player character and all their interactions
class Player < Character
  # Accessor so that the player velocity and "Creation Proc" can be accessed and changed
  attr_accessor :creation_proc, :velocity

  # Class is initialized with several nil values because they are not always used
  # and it was a feature that was added later, so default values stopped it from crashing
  def initialize(pos, effect = nil, e_cooldown = nil, creation_proc = nil)
    # Super to initialize the player with a default animation and health etc
    super(PLAYER_DOWN, pos, 80, nil)
    @velocity = Vector.new(:x => 0, :y => 0)
    @move = 0
    @effect = effect
    @e_cooldown = e_cooldown
    @e_current_cd = 0
    @creation_proc = creation_proc
  end

  # Updates different attributes of the player each frame of the game
  def update
    if @move.positive?
      animation.freeze = false
      @old = @pos
      @pos += @velocity
      @move -= 1
      do_create
    else
      # If player isn't moving set their sprite to the first
      # sprite in the animation (IDLE)
      animation.current_sprite_index = 0
      animation.freeze = true
    end
    update_animation
  end

  # Do create create a temporary object in the level
  # This is done by getting a "function" passed in from the level
  # this function takes an object and adds it to the temporary objects list
  # in the current level
  def do_create
    @e_current_cd -= 1
    # this stops the effect from running if
    # it doesn't exist or it's on cooldown
    return unless @effect && @e_cooldown && creation_proc && @e_current_cd.negative?

    # Resets the cooldown, and creates a copy of the object to pass through
    @e_current_cd = @e_cooldown
    new_effect = @effect.copy
    new_effect.pos = @pos + Vector.new(:x => width/2, :y => height - 1)
    creation_proc.call(new_effect)
  end

  # Changes the animation displayed based on the 
  # velocity of the character
  def update_animation
    case @velocity.normalized
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

  # Sets the velocity of the player
  # and sets a variable that keeps the player moving for
  # another 25 frames
  def move(velocity)
    @velocity = velocity
    @move = 25
  end
end
