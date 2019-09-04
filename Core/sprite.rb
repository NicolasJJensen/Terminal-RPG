# frozen_string_literal: true

# Class for a sprite which is a collection of graphics and other sprites
# This is to make graphics and sprites reuseable
# Contains the graphics to be drawn and where they should be positioned
class Sprite
  attr_accessor :pos
  attr_accessor :graphics
  attr_accessor :graphics_pos

  def initialize(graphics, graphics_pos)
    @graphics = graphics
    @graphics_pos = graphics_pos
  end

  def draw(win, pos)
    @graphics.each.with_index do |graphic, i|
      graphic.draw(win, pos + @graphics_pos[i])
    end
  end

  def width
    @graphics.map.with_index do |graphic, i|
      graphic.width + @graphics_pos[i].x
    end.max
  end

  def height
    @graphics.map.with_index do |graphic, i|
      graphic.height + @graphics_pos[i].y
    end.max
  end
end
