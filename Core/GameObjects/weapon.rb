# frozen_string_literal: true

require_relative '../game_object'

# Class for a weapon which can launch an attack
# (Unimplemented)
class Weapon < GameObject
  def initialize(animation, pos)
    super(animation, pos)
  end

  def update
    move(velocity)
  end

  def attack(direction); end
end
