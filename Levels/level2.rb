# frozen_string_literal: true

require_relative '../Core/level'
require_relative '../Core/GameObjects/Terrain/water'
require_relative '../Core/GameObjects/Misc/ripple'

ripple = Ripple.new(Vector.new(:x => 4, :y => 4))
player = Player.new(Vector.new(:x => 4, :y => 4), ripple, 20)

wall = GameObject.new(RawGraphic.new("=-=-\n-=-=\n=-=-\n-=-=", BRICK), Vector.new(:x => 0, :y => 0))
floor = Water.new(Vector.new(:x => 0, :y => 0))

LEVEL2 = Level.new('Hedge Maze Large', wall, floor, 10, 10, player)
