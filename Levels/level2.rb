# frozen_string_literal: true

require_relative '../Core/level'
require_relative '../Core/GameObjects/Terrain/water'
require_relative '../Core/GameObjects/Terrain/submerged_rock_class'
require_relative '../Core/GameObjects/Misc/ripple'

ripple = Ripple.new(Vector.new(:x => 4, :y => 4))
player = Player.new(Vector.new(:x => 4, :y => 4), ripple, 15)

wall = SubmergedRock.new(Vector.new(:x => 0, :y => 0))
floor = Water.new(Vector.new(:x => 0, :y => 0))

LEVEL2 = Level.new('Water Maze', wall, floor, 10, 10, player)
