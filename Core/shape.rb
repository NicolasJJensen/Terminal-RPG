# frozen_string_literal: true

require_relative './Helpers/paint_color'

# Abstract Class that contained information for each shape class inheriting from it
class Shape
  attr_accessor :char, :color

  def initialize(char, color)
    @color = color
    @char = char
  end
end

# Line class to draw a line between 2 points in a window
class Line < Shape
  attr_accessor :pos1, :pos2, :gradient

  def initialize(pos1, pos2, char, color)
    @pos1 = pos1.x <= pos2.x ? pos1 : pos2
    @pos2 = pos2.x >= pos1.x ? pos2 : pos1
    @gradient = (@pos1 - @pos2).gradient
    super(char, color)
  end

  def draw(win, pos)
    x = 0
    y = 0
    if (@gradient <= 1 && @gradient >= -1) && @gradient.finite?
      while x <= (@pos2.x - @pos1.x)
        win.setpos((y + pos.y + @pos1.y).round, (x + pos.x + @pos1.x).round)
        win.addch(@char)
        x += 1
        y += @gradient
      end
    elsif @gradient.finite?
      while y.abs <= (@pos2.y - @pos1.y).abs
        win.setpos((y + pos.y + @pos1.y).round, (x + pos.x + @pos1.x).round)
        win.addch(@char)
        x += 1 / @gradient.abs
        y += @gradient / @gradient.abs
      end
    else
      gradient = @gradient.positive? ? -1 : 1
      while y.abs <= (@pos2.y - @pos1.y).abs
        win.setpos(y + pos.y + @pos1.y, x + pos.x + @pos1.x)
        win.addch(@char)
        y += gradient
      end
    end
  end
end

# Circle class to draw a circle with a radius and width
class Circle < Shape
  attr_accessor :radius, :line_width

  def initialize(radius, line_width, char, color)
    @radius = radius
    @line_width = line_width
    @accuracy = radius * Math::PI * 2
    super(char, color)
  end

  def draw(win, pos)
    counter = 0
    while counter.abs <= Math::PI * 2
      x = Math.sin(counter)
      y = Math.cos(counter)
      x_pos = ((x * @radius) + pos.x).round
      y_pos = ((y * @radius) + pos.y).round
      if x_pos < win.maxx && y_pos < win.maxy && x_pos >= 0 && y_pos >= 0
        paint(win, @color) do
          win.setpos(y_pos, x_pos)
          win.addch(@char)
        end
      end
      counter += 1 / @accuracy.to_f
    end
  end

  def width
    @radius
  end

  def height
    @radius
  end
end

class NSidedShape < Shape
  attr_accessor :angle, :sides, :line_width, :radius, :points, :lines

  def initialize(radius, sides, line_width, char, color, angle = 0)
    super(char, color)

    @radius = radius
    @sides = sides
    @line_width = line_width
    @angle = angle
    @points = init_points
    @lines = init_lines
  end

  def update_angle(angle)
    @angle = angle
    @points = init_points
    @lines = init_lines
  end

  def draw(win, pos)
    @lines.each do |line|
      line.draw(win, pos)
    end
  end

  def init_points
    (0...@sides).map do |i|
      angle = i * (360 / @sides.to_f) + @angle
      Vector.new(:scalar => @radius, :angle => angle)
    end
  end

  def init_lines
    @points.map.with_index do |point, index|
      if index == @points.length - 1
        Line.new(point, @points[0], @char, 0)
      else
        Line.new(point, @points[index + 1], @char, 0)
      end
    end
  end
end
