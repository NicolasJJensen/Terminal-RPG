# frozen_string_literal: true

require_relative '../../sprite'
require_relative '../../vector'
require_relative './backward_raw_graphics'

PLAYER_HEAD = Sprite.new(
  [
    HEAD,
    HAIR
  ],
  [
    Vector.new(x: 0, y: 4),
    Vector.new(x: 0, y: 1),
    Vector.new(x: 0, y: 7)
  ]
)

PLAYER_BACKWARD1 = Sprite.new(
  [
    PLAYER_HEAD,
    SHIRT,
    ARM_IDLE,
    ARM_IDLE,
    PANTS,
    SHOES,
    BORDER_IDLE
  ],
  [
    Vector.new(x: 0, y: 0),
    Vector.new(x: 3, y: 9),
    Vector.new(x: 1, y: 11),
    Vector.new(x: 12, y: 11),
    Vector.new(x: 3, y: 13),
    Vector.new(x: 3, y: 16),
    Vector.new(x: 0, y: 0)
  ]
)

PLAYER_BACKWARD2 = Sprite.new(
  [
    PLAYER_HEAD,
    SHIRT_BACKWARD,
    ARM_LEFT_BACKWARD,
    ARM_RIGHT_FORWARD,
    PANTS_BACKWARD,
    SHOE,
    BORDER_BACKWARD
  ],
  [
    Vector.new(x: 0, y: 0),
    Vector.new(x: 3, y: 9),
    Vector.new(x: 2, y: 11),
    Vector.new(x: 11, y: 7),
    Vector.new(x: 3, y: 13),
    Vector.new(x: 8, y: 15),
    Vector.new(x: 1, y: 0)
  ]
)

PLAYER_BACKWARD3 = Sprite.new(
  [
    PLAYER_HEAD,
    SHIRT_BACKWARD.flip,
    ARM_LEFT_BACKWARD.flip,
    ARM_RIGHT_FORWARD.flip,
    PANTS_BACKWARD.flip,
    SHOE,
    BORDER_BACKWARD.flip
  ],
  [
    Vector.new(x: 0, y: 0),
    Vector.new(x: 3, y: 9),
    Vector.new(x: 10, y: 11),
    Vector.new(x: 1, y: 7),
    Vector.new(x: 3, y: 13),
    Vector.new(x: 3, y: 15),
    Vector.new(x: 0, y: 0)
  ]
)
