# frozen_string_literal: true

require_relative '../Core/level'
require_relative '../Core/GameObjects/Terrain/grass'

player = Player.new(Vector.new(:x => 4, :y => 4))
wall = GameObject.new(RawGraphic.new(".*.\n*.*\n.*.", HEDGE), Vector.new(:x => 0, :y => 0))
floor = Grass.new(Vector.new(:x => 0, :y => 0))

LEVEL0 = Level.new('Tutorial Maze', wall, floor, 2, 2, player)
