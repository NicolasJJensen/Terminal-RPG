# frozen_string_literal: true

require_relative '../../sprite'
require_relative '../../vector'
require_relative './player_raw_graphics'

PLAYER_IDLE = Sprite.new(
  [
    HEAD,
    HAIR,
    EYES,
    SHIRT,
    ARM_LEFT,
    ARM_RIGHT,
    PANTS,
    SHOES,
    BORDER
  ],
  [
    Vector.new(x: 0, y: 4),
    Vector.new(x: 0, y: 1),
    Vector.new(x: 0, y: 7),
    Vector.new(x: 0, y: 9),
    Vector.new(x: 0, y: 10),
    Vector.new(x: 0, y: 10),
    Vector.new(x: 0, y: 13),
    Vector.new(x: 0, y: 16),
    Vector.new(x: 0, y: 0)
  ]
)
