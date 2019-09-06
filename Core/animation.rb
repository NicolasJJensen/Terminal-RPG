# frozen_string_literal: true

# Class to keep track of which sprite in an animation is currently being shown
# and how often the animation should change
class Animation
  attr_accessor :fps, :sprites, :current_sprite_index, :sprite_positions, :freeze

  # Frame rate that the game is running at
  # this is used to decide how much to progress an animation
  # based on its FPS
  @@frame_rate = 30.0

  # initialize the animation wihh a list of sprites, their positions
  # and optionally and FPS
  def initialize(sprites, sprite_positions, fps = 0)
    @sprite_positions = sprite_positions
    @sprites = sprites
    @current_sprite_index = 0
    @fps = fps.to_f
    @freeze = false
  end

  # Draws a sprite to the screen and progresses the animation
  def draw(win, pos)
    index = @current_sprite_index.floor % @sprites.length
    @sprites[index].draw(win, pos + @sprite_positions[index])
    @current_sprite_index += (@fps / @@frame_rate.to_f) unless freeze
  end

  # returns the current sprite that is to be displayed
  def current_sprite
    @sprites[@current_sprite_index.floor % @sprites.length]
  end

  # returns the width of the current animation being displayed
  def width
    index = @current_sprite_index.floor % @sprites.length
    @sprites[index].width + @sprite_positions[index].x
  end

  # returns the height of the current animation being displayed
  def height
    index = @current_sprite_index.floor % @sprites.length
    @sprites[index].height + @sprite_positions[index].y
  end

  # overloading the == operator so that
  # two seperate instances of an Animation
  # can be compared properly
  def ==(other)
    @sprites == other.sprites &&
      @sprite_positions == other.sprite_positions &&
      @fps == other.fps
  end

  # returns how many frames it will take for an animation to complete
  # 1 loop
  def updates_till_complete
    update_amount = (@fps / @@frame_rate.to_f)
    @sprites.length / update_amount
  end

  # getters and setters for the frame_rate
  class << self
    def get_frame_rate
      @@frame_rate
    end

    def set_frame_rate(frame_rate)
      @@frame_rate = frame_rate.to_f
    end
  end
end
