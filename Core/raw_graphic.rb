# frozen_string_literal: true

require_relative './Helpers/paint_color'

# Class for any graphics draw to the screen
# Contains a color and the graphic to be drawn
class RawGraphic
  attr_accessor :color
  attr_accessor :graphic

  def initialize(graphic, color = 0, transparency = true)
    @transparency = transparency
    @graphic = graphic.reverse.chomp.reverse
    @color = color
  end

  def flip
    max_length = width
    new_graphic = @graphic.split("\n").map do |line|
      (line + (' ' * (max_length - line.length))).reverse
    end.join("\n")
    RawGraphic.new(new_graphic, @color, @transparency)
  end

  def draw(win, pos, color = @color)
    paint(win, color) do
      @graphic.split("\n").each.with_index do |line, row|
        line.chars.each.with_index do |char, col|
          win.setpos(pos.y + row, pos.x + col)
          next if pos.x + col >= win.maxx ||
                  (pos.x + col).negative? ||
                  pos.y + row >= win.maxy ||
                  (pos.y + row).negative? ||
                  (@transparency && char == ' ')

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
