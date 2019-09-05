
require_relative '../../animation'
require_relative '../../vector'
require_relative '../../shape'
require_relative '../../game_object'
require_relative '../../Colors/terrain'

Animation.set_frame_rate(30.0)

ripple_graphic1 = Circle.new(1, 1, '*', WATER_LIGHT)
ripple_graphic2 = Circle.new(3, 1, '*', WATER_LIGHT)
ripple_graphic3 = Circle.new(5, 1, '*', WATER_LIGHT)
ripple_graphic4 = Circle.new(7, 1, '*', WATER)
ripple_graphic5 = Circle.new(9, 1, '*', WATER)
ripple_graphic6 = Circle.new(11, 1, '*', WATER)
ripple_graphic7 = Circle.new(13, 1, '*', WATER)
ripple_graphic8 = Circle.new(15, 1, '*', WATER)

ripple_double1 = Sprite.new(
  [
    ripple_graphic2
  ],
  [
    Vector.new(:x => 0, :y => 0)
  ]
)

ripple_double2 = Sprite.new(
  [
    ripple_graphic3
  ],
  [
    Vector.new(:x => 0, :y => 0)
  ]
)

ripple_double3 = Sprite.new(
  [
    ripple_graphic1,
    ripple_graphic4
  ],
  [
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0)
  ]
)

ripple_double4 = Sprite.new(
  [
    ripple_graphic2,
    ripple_graphic5
  ],
  [
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0)
  ]
)

ripple_double5 = Sprite.new(
  [
    ripple_graphic3,
    ripple_graphic6
  ],
  [
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0)
  ]
)

ripple_double6 = Sprite.new(
  [
    ripple_graphic4
  ],
  [
    Vector.new(:x => 0, :y => 0)
  ]
)

ripple_double7 = Sprite.new(
  [
    ripple_graphic5
  ],
  [
    Vector.new(:x => 0, :y => 0)
  ]
)

ripple_double8 = Sprite.new(
  [
    ripple_graphic6
  ],
  [
    Vector.new(:x => 0, :y => 0)
  ]
)

ripple_double9 = Sprite.new(
  [
    ripple_graphic7
  ],
  [
    Vector.new(:x => 0, :y => 0)
  ]
)

ripple_double10 = Sprite.new(
  [
    ripple_graphic8
  ],
  [
    Vector.new(:x => 0, :y => 0)
  ]
)

RIPPLE_DOUBLE_ANIMATION = Animation.new(
  [
    ripple_double1,
    ripple_double2,
    ripple_double3,
    ripple_double4,
    ripple_double5,
    ripple_double6,
    ripple_double7,
    ripple_double8,
    ripple_double9,
    ripple_double10
  ],
  [
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0)
  ],
  8.0
)

RIPPLE_ANIMATION = Animation.new(
  [
    ripple_graphic2,
    ripple_graphic3,
    ripple_graphic4,
    ripple_graphic5,
    ripple_graphic6,
    ripple_graphic7
  ],
  [
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0)
  ],
  10.0
)

class Ripple < GameObject
  attr_accessor :finish

  def initialize(pos)
    super(RIPPLE_DOUBLE_ANIMATION.dup, pos)
    @finish = false
    @counter = 0
  end

  def copy
    Ripple.new(@pos)
  end

  def update
    @counter += 1
    @finish = true if @counter >= @animation.updates_till_complete
  end
end
