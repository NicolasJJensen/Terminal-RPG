# frozen_string_literal: true

require_relative '../../animation'
require_relative './forward_sprites'
require_relative './backward_sprites'
require_relative './left_sprites'
require_relative './right_sprites'

# Here we set they frame rate for the animation class
# This makes sure it is properly initialized when the animation
# is drawn and created

Animation.set_frame_rate(30.0)

# The 4 different animations for player movement

PLAYER_DOWN = Animation.new(
  [
    PLAYER_FORWARD1,
    PLAYER_FORWARD2,
    PLAYER_FORWARD1,
    PLAYER_FORWARD3
  ],
  [
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0)
  ],
  5
)

PLAYER_UP = Animation.new(
  [
    PLAYER_BACKWARD1,
    PLAYER_BACKWARD2,
    PLAYER_BACKWARD1,
    PLAYER_BACKWARD3
  ],
  [
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0)
  ],
  5
)

PLAYER_LEFT = Animation.new(
  [
    PLAYER_LEFT1,
    PLAYER_LEFT2
  ],
  [
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0)
  ],
  5
)

PLAYER_RIGHT = Animation.new(
  [
    PLAYER_RIGHT1,
    PLAYER_RIGHT2
  ],
  [
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 0, :y => 0)
  ],
  5
)
