
require_relative '../terrain'
require_relative './grass_animation'

# A class for the grass in the hedge level
# it is setup to make initializing only require a position
class Grass < Terrain
  def initialize(pos)
    super(GRASS_ANIMATION.dup, pos, 0, 1)
  end

  # This is to allow properly copying the Grass so that
  # not all grass uses the same animation when rendered
  def copy
    Grass.new(@pos)
  end
end
