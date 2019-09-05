
require_relative '../../animation'
require_relative '../../vector'
require_relative '../../raw_graphic'
require_relative '../../Colors/terrain'

Animation.set_frame_rate(30.0)

grass_sprite1 = Sprite.new(
  [
    RawGraphic.new('        ', GRASS, false),
    RawGraphic.new('    ))  ', GRASS, false),
    RawGraphic.new('   //   ', GRASS, false),
    RawGraphic.new('  ((    ', GRASS, false),
    RawGraphic.new('        ', GRASS, false)
  ],
  [
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 1),
    Vector.new(:x => 0, :y => 2),
    Vector.new(:x => 0, :y => 3),
    Vector.new(:x => 0, :y => 4),
    Vector.new(:x => 0, :y => 5)
  ]
)

grass_sprite2 = Sprite.new(
  [
    RawGraphic.new('        ', GRASS, false),
    RawGraphic.new('    //  ', GRASS, false),
    RawGraphic.new('   //   ', GRASS, false),
    RawGraphic.new('  ((    ', GRASS, false),
    RawGraphic.new('        ', GRASS, false)
  ],
  [
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 1),
    Vector.new(:x => 0, :y => 2),
    Vector.new(:x => 0, :y => 3),
    Vector.new(:x => 0, :y => 4),
    Vector.new(:x => 0, :y => 5)
  ]
)

grass_sprite3 = Sprite.new(
  [
    RawGraphic.new('        ', GRASS, false),
    RawGraphic.new('   //   ', GRASS, false),
    RawGraphic.new('  ((    ', GRASS, false),
    RawGraphic.new('  ||    ', GRASS, false),
    RawGraphic.new('        ', GRASS, false)
  ],
  [
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 1),
    Vector.new(:x => 0, :y => 2),
    Vector.new(:x => 0, :y => 3),
    Vector.new(:x => 0, :y => 4),
    Vector.new(:x => 0, :y => 5)
  ]
)

grass_sprite4 = Sprite.new(
  [
    RawGraphic.new('        ', GRASS, false),
    RawGraphic.new('  ||    ', GRASS, false),
    RawGraphic.new('  ||    ', GRASS, false),
    RawGraphic.new('  ||    ', GRASS, false),
    RawGraphic.new('        ', GRASS, false)
  ],
  [
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 1),
    Vector.new(:x => 0, :y => 2),
    Vector.new(:x => 0, :y => 3),
    Vector.new(:x => 0, :y => 4),
    Vector.new(:x => 0, :y => 5)
  ]
)

grass_sprite5 = Sprite.new(
  [
    RawGraphic.new('        ', GRASS, false),
    RawGraphic.new(' \\\\     ', GRASS, false),
    RawGraphic.new('  ))    ', GRASS, false),
    RawGraphic.new('  ||    ', GRASS, false),
    RawGraphic.new('        ', GRASS, false)
  ],
  [
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 1),
    Vector.new(:x => 0, :y => 2),
    Vector.new(:x => 0, :y => 3),
    Vector.new(:x => 0, :y => 4),
    Vector.new(:x => 0, :y => 5)
  ]
)

GRASS_ANIMATION = Animation.new(
  [
    grass_sprite1,
    grass_sprite2,
    grass_sprite3,
    grass_sprite4,
    grass_sprite5,
    grass_sprite4,
    grass_sprite3,
    grass_sprite2
  ],
  [
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
