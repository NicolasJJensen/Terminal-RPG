# frozen_string_literal: true

require_relative './Helpers/paint_color'

# Class for any graphics draw to the screen
# Contains a color and the graphic to be drawn
class RawGraphic
  attr_accessor :color
  attr_accessor :graphic

  def initialize(graphic, color, transparency = true)
    @transparency = transparency
    @graphic = graphic.rstrip.reverse.chomp.reverse
    @color = color
  end

  def draw(win, pos)
    paint(win, color) do
      @graphic.split("\n").each.with_index do |line, row|
        line.chars.each.with_index do |char, col|
          win.setpos(pos.y + row, pos.x + col)
          next if pos.x + col >= win.maxx || pos.y + row >= win.maxy || (@transparency && char == ' ')

          win.addch(char)
        end
      end
    end
  end

  def width
    @graphic.split("\n").map(&:length).max
  end

  def height
    @graphic.split("\n").length
  end
end
