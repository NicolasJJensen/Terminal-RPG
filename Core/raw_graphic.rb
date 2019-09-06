# frozen_string_literal: true

require_relative './Helpers/paint_color'

# Class for any graphics draw to the screen
# Contains a color and the graphic to be drawn
class RawGraphic
  attr_accessor :color
  attr_accessor :graphic

  # initialize with the graphic its color and whether blank strings should be transparent
  def initialize(graphic, color = 0, transparency = true)
    @transparency = transparency
    @graphic = graphic.reverse.chomp.reverse
    @color = color
  end

  # function to flip a sprite
  def flip
    max_length = width
    new_graphic = @graphic.split("\n").map do |line|
      (line + (' ' * (max_length - line.length))).reverse
    end.join("\n")
    RawGraphic.new(new_graphic, @color, @transparency)
  end

  # function to draw the graphic at a position with a coloe
  def draw(win, pos, color = @color)
    paint(win, color) do
      @graphic.split("\n").each.with_index do |line, row|
        line.chars.each.with_index do |char, col|
          win.setpos(pos.y + row, pos.x + col)
          # only draws if it's within the screen
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

  # returns the width of the graphic
  def width
    @graphic.split("\n").map(&:length).max
  end

  # returns the height of the graphic
  def height
    @graphic.split("\n").length
  end
end
