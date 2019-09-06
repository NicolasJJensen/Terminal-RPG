# frozen_string_literal: true

require_relative '../game_object'

# Class all terrain objects
class Terrain < GameObject
  attr_accessor :damage

  # damage is for things such as spikes
  # speed modifier is multiplier to speed
  # (Both unimplemented)
  def initialize(animation, pos, damage, speed_modifier)
    super(animation, pos)
    @damage = damage
    @speed_modifier = speed_modifier
  end
end
