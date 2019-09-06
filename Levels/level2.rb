# frozen_string_literal: true
require 'os'

require_relative '../Core/level'
require_relative '../Core/GameObjects/Terrain/water'
require_relative '../Core/GameObjects/Terrain/submerged_rock_class'
require_relative '../Core/GameObjects/Misc/ripple'

sound_proc = proc do
    if OS.windows?
      require 'win32/sound'
      Win32.Sound.play('Sound/puddle.mp3')
    elsif OS.mac?
      spawn('afplay Sound/puddle.mp3')
    elsif OS.posix?
      spawn('mpg123 Sound/puddle.mp3')
    end
end

# creates a ripple effect and applies it as an effect on the player
# with a cooldown of 10 frames

ripple = Ripple.new(Vector.new(:x => 4, :y => 4))
player = Player.new(Vector.new(:x => 4, :y => 4), ripple, sound_proc, 10)

wall = SubmergedRock.new(Vector.new(:x => 0, :y => 0))
floor = Water.new(Vector.new(:x => 0, :y => 0))

# initializes the water maze

LEVEL2 = Level.new('Water Maze', wall, floor, 10, 10, player)
