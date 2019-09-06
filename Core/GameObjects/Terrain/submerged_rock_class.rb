require_relative './submerged_rock'

# Class for the rocks displayed in the water level
# once again set up to allow easy initialization
class SubmergedRock < Terrain
  def initialize(pos)
    super(SUBMERGED_ROCK_ANIMATION.dup, pos, 0, 1)
    @animation.current_sprite_index = rand(3)
  end

  # Copy is there to allow easy duplication
  # without sharing animations
  def copy
    SubmergedRock.new(@pos)
  end
end
