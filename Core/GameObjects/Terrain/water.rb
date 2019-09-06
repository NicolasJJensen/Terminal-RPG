
require_relative '../terrain'
require_relative './water_animation'

# Water class so the water floor can be easily initialized
class Water < Terrain
  def initialize(pos)
    super(WATER_ANIMATION.dup, pos, 0, 1)
  end

  # Copy function for true copies so copies dont share animations
  def copy
    Water.new(@pos)
  end
end
