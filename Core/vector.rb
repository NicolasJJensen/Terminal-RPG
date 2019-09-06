# Class to handle positions, speeds, lines, and their operations
class Vector
  attr_accessor :x, :y

  # it takes a hash so that it can be initialized with either
  # X and Y OR
  # a size and angle
  def initialize(args)
    if args.key?(:x) && args.key?(:y)
      @x = args[:x]
      @y = args[:y]
    elsif args.key?(:scalar) && args.key?(:angle)
      @x = Math.cos(args[:angle] * Math::PI / 180.0) * args[:scalar]
      @y = Math.sin(args[:angle] * Math::PI / 180.0) * args[:scalar]
    end
  end

  # adds 2 vectors and returns the result
  def +(other)
    Vector.new(:x => @x + other.x, :y => @y + other.y)
  end

  # subtracts 2 vectors an returns result
  def -(other)
    Vector.new(:x => @x - other.x, :y => @y - other.y)
  end

  # multiplies vector by a constant
  def *(other)
    Vector.new(:x => @x * other, :y => @y * other)
  end

  # divides the vector by a contstant
  def /(other)
    self * (1.0 / other)
  end

  # finds the size of a vector
  def scalar
    scalar_sqr**0.5
  end

  # find the size squared (more efficent)
  def scalar_sqr
    (@x**2 + @y**2)
  end

  # normalizes the vector (sets size to 1, keeps direction)
  def normalized
    self / scalar
  end

  # find the distance between 2 points (squared)
  def distance_sqr(other)
    (self - other).scalar_sqr
  end

  # find the distance between 2 points
  def distance(other)
    distance_sqr(other)**0.5
  end

  # returns the gradient of a vector
  def gradient
    @y / @x.to_f
  end

  # comparison overloading
  def <=>(other)
    [@x, @y] <=> [other.x, other.y]
  end

  # equality overloading
  def ==(other)
    [@x, @y] == [other.x, other.y]
  end
end
