# frozen_string_literal: true

require_relative '../character'
require_relative './player_animations'

# Class for the player character and all their interactions
class Player < Character
  def initialize(pos)
    super(PLAYER_ANIMATION, pos, 100, nil)
  end
end
