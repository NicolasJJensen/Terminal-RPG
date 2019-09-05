# frozen_string_literal: true

require_relative '../../sprite'
require_relative '../../vector'
require_relative './left_raw_graphics'

PLAYER_HEAD = Sprite.new(
  [
    HEAD.flip,
    HAIR.flip,
    EYES
  ],
  [
    Vector.new(x: 0, y: 3),
    Vector.new(x: 0, y: 0),
    Vector.new(x: 7, y: 5)
  ]
)

PLAYER_RIGHT1 = Sprite.new(
  [
    PLAYER_HEAD,
    SHIRT.flip,
    ARM_IDLE,
    PANTS.flip,
    SHOE,
    BORDER_IDLE.flip
  ],
  [
    Vector.new(x: 1, y: 1),
    Vector.new(x: 3, y: 11),
    Vector.new(x: 5, y: 12),
    Vector.new(x: 4, y: 14),
    Vector.new(x: 4, y: 15),
    Vector.new(x: 0, y: 0)
  ]
)

PLAYER_RIGHT2 = Sprite.new(
  [
    PLAYER_HEAD,
    SHIRT_MOVING.flip,
    ARM_IDLE,
    ARM_MOVING.flip,
    PANTS.flip,
    SHOES.flip,
    BORDER_MOVING.flip
  ],
  [
    Vector.new(x: 1, y: 1),
    Vector.new(x: 4, y: 11),
    Vector.new(x: 2, y: 10),
    Vector.new(x: 7, y: 10),
    Vector.new(x: 4, y: 13),
    Vector.new(x: 2, y: 13),
    Vector.new(x: 0, y: 0)
  ]
)
