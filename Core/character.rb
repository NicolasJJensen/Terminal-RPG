
class Character < GameObject
  def initialize(animation, pos, health, energy, weapon, skill)
    super(animation, pos)
    @health = health
    @energy = energy
    @weapon = weapon
    @skill = skill
  end
end