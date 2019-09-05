# frozen_string_literal: true

require_relative '../../animation'
require_relative './player_sprites'

PLAYER_ANIMATION = Animation.new(
  [PLAYER_IDLE],
  [Vector.new(:x => 0, :y => 0)],
  60
)
