# frozen_string_literal: true

# Class for a sprite which is a collection of graphics and other sprites
# This is to make graphics and sprites reuseable
# Contains the graphics to be drawn and where they should be positioned
class Sprite
  attr_accessor :pos
  attr_accessor :graphics
  attr_accessor :graphics_pos

  # initialize with a list of graphics OR sprites
  # and their positios
  def initialize(graphics, graphics_pos)
    @graphics = graphics
    @graphics_pos = graphics_pos
  end

  # recursively draw the graphics and any nested sprites
  def draw(win, pos)
    @graphics.each.with_index do |graphic, i|
      graphic.draw(win, pos + @graphics_pos[i])
    end
  end

  # return the width of the sprite
  def width
    @graphics.map.with_index do |graphic, i|
      graphic.width + @graphics_pos[i].x
    end.max
  end

  # return the height of the sprite
  def height
    @graphics.map.with_index do |graphic, i|
      graphic.height + @graphics_pos[i].y
    end.max
  end

  # equality overload so that sprites can be compared
  def ==(other)
    @graphics == other.graphics &&
      @graphics_pos == other.graphics_pos
  end
end
