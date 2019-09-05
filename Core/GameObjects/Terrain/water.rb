
require_relative '../terrain'
require_relative './water_animation'

class Water < Terrain
  def initialize(pos)
    super(WATER_ANIMATION.dup, pos, 0, 1)
  end

  def copy
    Water.new(@pos)
  end
end
