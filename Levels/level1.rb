# frozen_string_literal: true

require_relative '../Core/level'
require_relative '../Core/GameObjects/Terrain/grass'

wall = GameObject.new(RawGraphic.new(".*.\n*.*\n.*.", HEDGE), Vector.new(:x => 0, :y => 0))
floor = Grass.new(Vector.new(:x => 0, :y => 0))

LEVEL1 = Level.new('Hedge Maze', wall, floor, 5, 5)
