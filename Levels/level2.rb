# frozen_string_literal: true

require_relative '../Core/level'
require_relative '../Core/GameObjects/Terrain/grass'

wall = GameObject.new(RawGraphic.new("=-=-\n-=-=\n=-=-\n-=-=", BRICK), Vector.new(:x => 0, :y => 0))
floor = Grass.new(Vector.new(:x => 0, :y => 0))

LEVEL2 = Level.new('Hedge Maze Large', wall, floor, 10, 10)
