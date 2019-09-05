# frozen_string_literal: true

require_relative './Helpers/paint_color'

# Class for any graphics draw to the screen
# Contains a color and the graphic to be drawn
class RawGraphic
  attr_accessor :color
  attr_accessor :graphic

  def initialize(graphic, color)
    @graphic = graphic.rstrip.reverse.chomp.reverse
    @color = color
  end

  def draw(win, pos)
    paint(color) do
      @graphic.split("\n").each.with_index do |line, row|
        win.setpos(pos.y + row, pos.x)

        line.chars.each.with_index do |char, col|
          next if pos.x + col >= win.maxx || pos.y + row >= win.maxy

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
