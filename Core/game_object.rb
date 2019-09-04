# frozen_string_literal: true

# Class for any sprite/animation on the screen
# Contains an x and y position and a sprite/graphic/animation
# and methods to manipulate and draw the object
class GameObject
  attr_accessor :animation
  attr_accessor :pos
  attr_accessor :old

  def initialize(animation, pos)
    @animation = animation
    @pos = pos
    @old = pos
  end

  def draw(win)
    @animation.draw(win, @pos)
  end

  def move(direction)
    @old = @pos
    @pos += direction
  end

  def width
    @animation.current_sprite.width
  end

  def height
    @animation.current_sprite.height
  end

  def collides?(other)
    !(
      @pos.x + width <= other.pos.x ||
      @pos.x >= other.pos.x + other.width ||
      @pos.y + height <= other.pos.y ||
      @pos.y >= other.pos.y + other.height
    )
  end
end
