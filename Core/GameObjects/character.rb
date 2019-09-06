# frozen_string_literal: true

require_relative '../game_object'

# Class for characters that move around the screen
class Character < GameObject
  attr_accessor :health

  # Character is allowed a weapon but this functionality
  # hasn't been added yet
  def initialize(animation, pos, health, weapon)
    super(animation, pos)
    @health = health
    @weapon = weapon
    @invincibility = 0
  end

  # This reduces the invincibility time
  # so the player can have a short window
  # on invun when hurt
  def update(time_passed)
    @invincibility -= time_passed
  end

  # function to deal with being hit and
  # destroy the projectile that collides
  # with the player
  def hit_by_attack(other)
    return if invincibility.positive?

    @health -= other.damage
    other.destroy
  end

  # Function to launch the weapons attack
  # (Unimplemented and needs cooldown)
  def attack(direction)
    @weapon.attack(direction)
  end
end
