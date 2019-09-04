class Vector
  attr_accessor :x, :y

  def initialize(args)
    if args.key?(:x) && args.key?(:y)
      @x = args[:x]
      @y = args[:y]
    elsif args.key?(:scalar) && args.key?(:angle)
      @x = Math.cos(args[:angle] * Math::PI / 180.0) * args[:scalar]
      @y = Math.sin(args[:angle] * Math::PI / 180.0) * args[:scalar]
    end
  end

  def +(other)
    Vector.new(:x => @x + other.x, :y => @y + other.y)
  end

  def -(other)
    Vector.new(:x => @x - other.x, :y => @y - other.y)
  end

  def *(other)
    Vector.new(:x => @x * other, :y => @y * other)
  end

  def /(other)
    self * (1.0 / other)
  end

  def scalar
    scalar_sqr**0.5
  end

  def scalar_sqr
    (@x**2 + @y**2)
  end

  def normalized
    self / scalar
  end

  def distance_sqr(other)
    (self - other).scalar_sqr
  end

  def distance(other)
    distance_sqr(other)**0.5
  end

  def gradient
    @y / @x.to_f
  end

  def <=>(other)
    [@x, @y] <=> [other.x, other.y]
  end

  def ==(other)
    [@x, @y] == [other.x, other.y]
  end
end
