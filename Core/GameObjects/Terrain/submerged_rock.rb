
require_relative '../../animation'
require_relative '../../vector'
require_relative '../../raw_graphic'
require_relative '../../Colors/terrain'

# Initaliaze animation frame rate so that
# rendering works no matter which order
# sprites are initialized

Animation.set_frame_rate(30.0)

# A list of sprites for the rock
# and the water splash in the animation

rock = "

   **
  ****
 *****
"

rock2 = "
   __
  _  _
 _____
"

water_splash1 = "



 ^    )
v^v  /
"

water_splash2 = "



     C
 v ^
"

water_splash3 = "



   )
v V
"

water_splash4 = "




 V^
"

# Setting up the different sprites for each
# frame of the animation

submerged_rock1 = Sprite.new(
  [
    RawGraphic.new(rock, ROCK),
    RawGraphic.new(rock2, ROCK_DARK),
    RawGraphic.new(water_splash1, WATER_LIGHT)
  ],
  [
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0)
  ]
)

submerged_rock2 = Sprite.new(
  [
    RawGraphic.new(rock, ROCK),
    RawGraphic.new(rock2, ROCK_DARK),
    RawGraphic.new(water_splash2, WATER)
  ],
  [
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0)
  ]
)

submerged_rock3 = Sprite.new(
  [
    RawGraphic.new(rock, ROCK),
    RawGraphic.new(rock2, ROCK_DARK),
    RawGraphic.new(water_splash3, WATER)
  ],
  [
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0)
  ]
)

submerged_rock4 = Sprite.new(
  [
    RawGraphic.new(rock, ROCK),
    RawGraphic.new(rock2, ROCK_DARK),
    RawGraphic.new(water_splash4, WATER)
  ],
  [
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0)
  ]
)

SUBMERGED_ROCK_ANIMATION = Animation.new(
  [
    submerged_rock1,
    submerged_rock2,
    submerged_rock3,
    submerged_rock4
  ],
  [
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0)
  ],
  4.0
)
