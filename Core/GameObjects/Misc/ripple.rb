
require_relative '../../animation'
require_relative '../../vector'
require_relative '../../shape'
require_relative '../../game_object'
require_relative '../../Colors/terrain'

Animation.set_frame_rate(30.0)

# The circle graphics used for the animated ripple

ripple_graphic1 = Circle.new(1, 1, '.', WATER_LIGHT)
ripple_graphic2 = Circle.new(3, 1, '.', WATER_LIGHT)
ripple_graphic3 = Circle.new(5, 1, '*', WATER_LIGHT)
ripple_graphic4 = Circle.new(7, 1, '*', WATER)
ripple_graphic5 = Circle.new(9, 1, '*', WATER)
ripple_graphic6 = Circle.new(11, 1, '*', WATER)
ripple_graphic7 = Circle.new(13, 1, '*', WATER)
ripple_graphic8 = Circle.new(15, 1, '*', WATER)

# ====== The double ripple sprites (looks better than single) =============#

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

# Putting the ripples together into an animation that loops

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
  10.0
)

# The single ripple animation

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

# The ripple class

class Ripple < GameObject
  attr_accessor :finish

  def initialize(pos)
    # initialized with a .dup of the animation so they dont all share the same one
    super(RIPPLE_DOUBLE_ANIMATION.dup, pos)
    @finish = false
    @counter = 0
  end

  # A function to properly copy the ripple instance
  # this allows for duplicating the ripple
  def copy
    Ripple.new(@pos)
  end

  # the update function keeps track of when the ripple should be deleted with the finish attr
  def update
    @counter += 1
    @finish = true if @counter >= @animation.updates_till_complete
  end
end
