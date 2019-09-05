# frozen_string_literal: true

require_relative '../game_object'

# Class for an attack which is treated like a projectile
class Terrain < GameObject
  attr_accessor :damage

  def initialize(animation, pos, damage, speed_modifier)
    super(animation, pos)
    @damage = damage
    @speed_modifier = speed_modifier
  end
end
