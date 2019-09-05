require_relative './submerged_rock'

class SubmergedRock < Terrain
  def initialize(pos)
    super(SUBMERGED_ROCK_ANIMATION.dup, pos, 0, 1)
    @animation.current_sprite_index = rand(3)
  end

  def copy
    SubmergedRock.new(@pos)
  end
end
