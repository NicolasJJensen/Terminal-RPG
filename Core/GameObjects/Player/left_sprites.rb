# frozen_string_literal: true

require_relative '../../sprite'
require_relative '../../vector'
require_relative './left_raw_graphics'

# Head sprite done on it's own for re-useability again

PLAYER_HEAD = Sprite.new(
  [
    HEAD,
    HAIR,
    EYES
  ],
  [
    Vector.new(x: 1, y: 3),
    Vector.new(x: 0, y: 0),
    Vector.new(x: 2, y: 5)
  ]
)

# All other sprites for the animation

PLAYER_LEFT1 = Sprite.new(
  [
    PLAYER_HEAD,
    SHIRT,
    ARM_IDLE,
    PANTS,
    SHOE,
    BORDER_IDLE
  ],
  [
    Vector.new(x: 1, y: 1),
    Vector.new(x: 4, y: 11),
    Vector.new(x: 5, y: 12),
    Vector.new(x: 4, y: 14),
    Vector.new(x: 4, y: 15),
    Vector.new(x: 0, y: 0)
  ]
)

PLAYER_LEFT2 = Sprite.new(
  [
    PLAYER_HEAD,
    SHIRT_MOVING,
    ARM_IDLE,
    ARM_MOVING,
    PANTS,
    SHOES,
    BORDER_MOVING
  ],
  [
    Vector.new(x: 1, y: 1),
    Vector.new(x: 3, y: 11),
    Vector.new(x: 7, y: 10),
    Vector.new(x: 2, y: 10),
    Vector.new(x: 4, y: 13),
    Vector.new(x: 1, y: 13),
    Vector.new(x: 0, y: 0)
  ]
)
