# frozen_string_literal: true

require_relative '../game_object'

# Class for an attack which is treated like a projectile
class Attack < GameObject
  attr_accessor :damage

  def initialize(animation, pos, damage, id, destroy_proc, velocity = Vector.new(x: 0, y: 0))
    super(animation, pos)
    @damage = damage
    @id = id
    @velocity = velocity
    @destroy_proc = destroy_proc
  end

  def update
    move(velocity)
  end

  def collided
    @destroy_proc.call(id)
  end
end
