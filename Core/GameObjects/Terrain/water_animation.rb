
require_relative '../../animation'
require_relative '../../vector'
require_relative '../../raw_graphic'
require_relative '../../Colors/terrain'

Animation.set_frame_rate(30.0)

water_sprite1 = Sprite.new(
  [
    RawGraphic.new('        ', WATER_LIGHT, false),
    RawGraphic.new('        ', WATER_LIGHT, false),
    RawGraphic.new('        ', WATER_LIGHT, false),
    RawGraphic.new('        ', WATER_LIGHT, false),
    RawGraphic.new('        ', WATER_LIGHT, false)
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

water_sprite2 = Sprite.new(
  [
    RawGraphic.new('        ', WATER_LIGHT, false),
    RawGraphic.new('        ', WATER_LIGHT, false),
    RawGraphic.new('        ', WATER_LIGHT, false),
    RawGraphic.new('        ', WATER_LIGHT, false),
    RawGraphic.new('        ', WATER_LIGHT, false)
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

water_sprite3 = Sprite.new(
  [
    RawGraphic.new('        ', WATER_LIGHT, false),
    RawGraphic.new('        ', WATER_LIGHT, false),
    RawGraphic.new('        ', WATER_LIGHT, false),
    RawGraphic.new('        ', WATER_LIGHT, false),
    RawGraphic.new('        ', WATER_LIGHT, false)
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

water_sprite4 = Sprite.new(
  [
    RawGraphic.new('        ', WATER_LIGHT, false),
    RawGraphic.new('        ', WATER_LIGHT, false),
    RawGraphic.new('        ', WATER_LIGHT, false),
    RawGraphic.new('        ', WATER_LIGHT, false),
    RawGraphic.new('        ', WATER_LIGHT, false)
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

water_sprite5 = Sprite.new(
  [
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('    <   ', WATER, false),
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('        ', WATER, false)
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

water_sprite6 = Sprite.new(
  [
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('   _Y   ', WATER, false),
    RawGraphic.new('    \   ', WATER, false),
    RawGraphic.new('        ', WATER, false)
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

water_sprite7 = Sprite.new(
  [
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('  .  .  ', WATER, false),
    RawGraphic.new('   "*   ', WATER, false),
    RawGraphic.new('   \-   ', WATER, false),
    RawGraphic.new('        ', WATER, false)
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

water_sprite8 = Sprite.new(
  [
    RawGraphic.new('        ', WATER_LIGHT, false),
    RawGraphic.new('  ( _)  ', WATER_LIGHT, false),
    RawGraphic.new('  /\/   ', WATER_LIGHT, false),
    RawGraphic.new(' ( _)   ', WATER_LIGHT, false),
    RawGraphic.new('        ', WATER_LIGHT, false)
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

water_sprite9 = Sprite.new(
  [
    RawGraphic.new('        ', WATER_LIGHT, false),
    RawGraphic.new(' .\-- / ', WATER_LIGHT, false),
    RawGraphic.new('   \ /  ', WATER_LIGHT, false),
    RawGraphic.new(' .   ,  ', WATER_LIGHT, false),
    RawGraphic.new('    -   ', WATER_LIGHT, false)
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

water_sprite10 = Sprite.new(
  [
    RawGraphic.new('    .   ', WATER, false),
    RawGraphic.new(' .     .', WATER, false),
    RawGraphic.new('      . ', WATER, false),
    RawGraphic.new('   (    ', WATER, false),
    RawGraphic.new('        ', WATER, false)
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

water_sprite11 = Sprite.new(
  [
    RawGraphic.new('        ', WATER_LIGHT, false),
    RawGraphic.new('        ', WATER_LIGHT, false),
    RawGraphic.new('        ', WATER_LIGHT, false),
    RawGraphic.new('        ', WATER_LIGHT, false),
    RawGraphic.new('        ', WATER_LIGHT, false)
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

water_sprite12 = Sprite.new(
  [
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('        ', WATER, false)
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

water_sprite13 = Sprite.new(
  [
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('        ', WATER, false)
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

water_sprite14 = Sprite.new(
  [
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('   .    ', WATER, false),
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('        ', WATER, false)
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

water_sprite15 = Sprite.new(
  [
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('   *    ', WATER, false),
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('        ', WATER, false)
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

water_sprite16 = Sprite.new(
  [
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('    )   ', WATER, false),
    RawGraphic.new('   X    ', WATER, false),
    RawGraphic.new('  (     ', WATER, false),
    RawGraphic.new('        ', WATER, false)
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

water_sprite17 = Sprite.new(
  [
    RawGraphic.new('        ', WATER_LIGHT, false),
    RawGraphic.new('  \  )  ', WATER_LIGHT, false),
    RawGraphic.new('   \    ', WATER_LIGHT, false),
    RawGraphic.new(' (  \   ', WATER_LIGHT, false),
    RawGraphic.new('        ', WATER_LIGHT, false)
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

water_sprite18 = Sprite.new(
  [
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new(' {      ', WATER, false),
    RawGraphic.new('   *    ', WATER, false),
    RawGraphic.new('     }  ', WATER, false),
    RawGraphic.new('        ', WATER, false)
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

water_sprite19 = Sprite.new(
  [
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('   .    ', WATER, false),
    RawGraphic.new('  . .   ', WATER, false),
    RawGraphic.new('   .    ', WATER, false),
    RawGraphic.new('        ', WATER, false)
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

water_sprite20 = Sprite.new(
  [
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('        ', WATER, false)
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

water_sprite21 = Sprite.new(
  [
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('        ', WATER, false)
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

water_sprite22 = Sprite.new(
  [
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('        ', WATER, false),
    RawGraphic.new('        ', WATER, false)
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

WATER_ANIMATION = Animation.new(
  [
    water_sprite1,
    water_sprite2,
    water_sprite3,
    water_sprite4,
    water_sprite5,
    water_sprite6,
    water_sprite7,
    water_sprite8,
    water_sprite9,
    water_sprite10,
    water_sprite11,
    water_sprite12,
    water_sprite13,
    water_sprite14,
    water_sprite15,
    water_sprite16,
    water_sprite17,
    water_sprite18,
    water_sprite19,
    water_sprite20,
    water_sprite21,
    water_sprite22,
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
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0),
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
  5.0
)
