# frozen_string_literal: true

require_relative '../game_object'

# Class for characters that move around the screen
class Character < GameObject
  attr_accessor :health

  def initialize(animation, pos, health, weapon)
    super(animation, pos)
    @health = health
    @weapon = weapon
    @invincibility = 0
  end

  def update(time_passed)
    @invincibility -= time_passed
  end

  def hit_by_attack(other)
    return if invincibility.positive?

    @health -= other.damage
    other.destroy
  end

  def attack(direction)
    @weapon.attack(direction)
  end
end
