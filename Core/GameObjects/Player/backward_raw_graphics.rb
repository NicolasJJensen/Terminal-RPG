# frozen_string_literal: true

require_relative '../../raw_graphic'
require_relative '../../shape'
require_relative '../../Colors/character'

# A bunch fo graphics for when the character is facing down

hair = "
     ****
   ********
   ********
  **********
  **********
  **********
    ******
      **
"

head = "
  **********
  **********
  **********
   ********
    ******
     ****
"

shirt = "
*      *
**    **
********
 ******
"

arm_idle = "
*
*
"

pants = "
*      *
********
***  ***
"

shoes = "
***  ***
"

border_idle = "
     ****
   **    **
  *        *
  *        *
 *          *
 *          *
 *          *
  *        *
   *      *
  * *    * *
 **  ****  **
* *        * *
* **      ** *
 ** ****** **
  *        *
  *   **   *
  *   **   *
   ***  ***
"

arm_left_backward = "
**
**
"

arm_right_forward = "
 *
**
"

shirt_forward = "
*      *
 *    **
  *****
"

pants_backward = "
      *
*******
    ***
"

shoe = "
****
"

border_backward = "
    ****
  **    **
 *        *
 *        *
*          *
*          *
*          *
 *        * *
  *      *  *
 * *    * **
 ** ****  *
*  *     **
*  ****** *
 **       *
   ****   *
      *   *
       ***
"

# Here we compile all the graphics together into a RawGraphic
# We aso add a color from an external file with all the color
# attributes for the player character

HAIR = RawGraphic.new(hair, PLAYER_HAIR)
HEAD = RawGraphic.new(head, PLAYER_SKIN)
SHIRT = RawGraphic.new(shirt, PLAYER_SHIRT)
ARM_IDLE = RawGraphic.new(arm_idle, PLAYER_SKIN)
PANTS = RawGraphic.new(pants, PLAYER_PANTS)
SHOES = RawGraphic.new(shoes, PLAYER_SHOES)
BORDER_IDLE = RawGraphic.new(border_idle, PLAYER_BORDER)
ARM_RIGHT_FORWARD = RawGraphic.new(arm_right_forward, PLAYER_SKIN)
ARM_LEFT_BACKWARD = RawGraphic.new(arm_left_backward, PLAYER_SKIN)
SHIRT_BACKWARD = RawGraphic.new(shirt_forward, PLAYER_SHIRT)
PANTS_BACKWARD = RawGraphic.new(pants_backward, PLAYER_PANTS)
BORDER_BACKWARD = RawGraphic.new(border_backward, PLAYER_BORDER)
SHOE = RawGraphic.new(shoe, PLAYER_SHOES)
