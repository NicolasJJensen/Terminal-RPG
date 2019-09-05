
require_relative '../terrain'
require_relative './grass_animation'

class Grass < Terrain
  def initialize(pos)
    super(GRASS_ANIMATION.dup, pos, 0, 1)
  end

  def copy
    Grass.new(@pos)
  end
end
