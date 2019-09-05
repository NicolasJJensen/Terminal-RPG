# frozen_string_literal: true

require_relative '../../sprite'
require_relative '../../vector'
require_relative './forward_raw_graphics'

PLAYER_HEAD = Sprite.new(
  [
    HEAD,
    HAIR,
    EYES
  ],
  [
    Vector.new(x: 0, y: 4),
    Vector.new(x: 0, y: 1),
    Vector.new(x: 0, y: 7)
  ]
)

PLAYER_FORWARD1 = Sprite.new(
  [
    PLAYER_HEAD,
    SHIRT,
    ARM_LEFT,
    ARM_RIGHT,
    PANTS,
    SHOES,
    BORDER_IDLE
  ],
  [
    Vector.new(x: 0, y: 0),
    Vector.new(x: 0, y: 9),
    Vector.new(x: 0, y: 10),
    Vector.new(x: 0, y: 10),
    Vector.new(x: 0, y: 13),
    Vector.new(x: 0, y: 16),
    Vector.new(x: 0, y: 0)
  ]
)

PLAYER_FORWARD2 = Sprite.new(
  [
    PLAYER_HEAD,
    SHIRT_FORWARD,
    ARM_LEFT_FORWARD,
    ARM_RIGHT_BACKWARD,
    LEFT_LEG_FORWARD,
    RIGHT_LEG_BACKWARD,
    SHOE,
    BORDER_FORWARD
  ],
  [
    Vector.new(x: 0, y: 0),
    Vector.new(x: 6, y: 9),
    Vector.new(x: 2, y: 9),
    Vector.new(x: 11, y: 8),
    Vector.new(x: 3, y: 13),
    Vector.new(x: 8, y: 12),
    Vector.new(x: 8, y: 15),
    Vector.new(x: 1, y: 0)
  ]
)

PLAYER_FORWARD3 = Sprite.new(
  [
    PLAYER_HEAD,
    SHIRT_FORWARD.flip,
    ARM_LEFT_FORWARD.flip,
    ARM_RIGHT_BACKWARD.flip,
    LEFT_LEG_FORWARD.flip,
    RIGHT_LEG_BACKWARD.flip,
    SHOE,
    BORDER_FORWARD.flip
  ],
  [
    Vector.new(x: 0, y: 0),
    Vector.new(x: 3, y: 9),
    Vector.new(x: 9, y: 9),
    Vector.new(x: 1, y: 8),
    Vector.new(x: 3, y: 12),
    Vector.new(x: 7, y: 13),
    Vector.new(x: 3, y: 15),
    Vector.new(x: 0, y: 0)
  ]
)
