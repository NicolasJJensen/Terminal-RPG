
require_relative '../vector'
require_relative '../raw_graphic'
require_relative '../sprite'
require_relative '../Colors/character'

# This is setup for the health bar sprite

HP_graphic = RawGraphic.new(
  "
| | |-|     
| | | | o   
|-| |-|     
| | |   o   
| | |       
",
  HEALTH_BAR
)

HP_bar_seperator = RawGraphic.new(
  "
|
|
|
|
",
  PLAYER_BORDER
)

HP_bar_block = RawGraphic.new(
  "
***
***
***
***
",
  HEALTH_BAR
)

HP_bar_base = RawGraphic.new(
  "
*****************************************
",
  PLAYER_BORDER
)

HP_block = Sprite.new(
  [
    HP_bar_block,
    HP_bar_seperator
  ],
  [
    Vector.new(:x => 0, :y => 0),
    Vector.new(:x => 3, :y => 0)
  ]
)

HP_empty_block = Sprite.new(
  [
    HP_bar_seperator
  ],
  [
    Vector.new(:x => 3, :y => 0)
  ]
)

# helper function that takes a percentage
# and returns a sprite of the hud
def get_hud(percentage)
  # creates blocks for the amount of health
  hp_block_group = (percentage * 10).to_i.times.map do
    HP_block
  end

  # creates blocks for the missing health
  hp_empty_group = (10 - percentage * 10).to_i.times.map do
    HP_empty_block
  end

  # initializes the hud sprite with correct graphics
  # in position
  Sprite.new(
    [
      HP_graphic,
      HP_bar_seperator,
      HP_bar_base,
      *hp_block_group,
      *hp_empty_group
    ],
    [
      Vector.new(:x => 0, :y => 0),
      Vector.new(:x => 12, :y => 0),
      Vector.new(:x => 12, :y => 4),
      Vector.new(:x => 13, :y => 0),
      Vector.new(:x => 17, :y => 0),
      Vector.new(:x => 21, :y => 0),
      Vector.new(:x => 25, :y => 0),
      Vector.new(:x => 29, :y => 0),
      Vector.new(:x => 33, :y => 0),
      Vector.new(:x => 37, :y => 0),
      Vector.new(:x => 41, :y => 0),
      Vector.new(:x => 45, :y => 0),
      Vector.new(:x => 49, :y => 0)
    ]
  )
end
