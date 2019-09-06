# frozen_string_literal: true

require_relative '../../raw_graphic'
require_relative '../../shape'
require_relative '../../Colors/character'

# a list of strings for the player moving down animation

hair = "
     ****
   ********
   ********
  * ********
      *****
"

head = "
  **********
  **********
  **********
   ********
    ******
     ****
"

eyes = "
     *  *
     *  *
"

shirt = "
   *      *
   **    **
   ********
   ********
"

arm_left = "
  *
 **
 **
"

arm_right = "
           *
           **
           **
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
 *   ****   *
*  *      *  *
*  *      *  *
 ** ****** **
  *        *
  *   **   *
  *   **   *
   ***  ***
"

arm_left_forward = "
*
 **
 **
"

arm_right_backward = "
**
 *
"

shirt_forward = "
    *
   **
***
"

left_leg_forward = "
****
"

right_leg_backward = "
 ***
****
****
"

shoe = "
****
"

border_forward = "
    ****
  **    **
 *        *
 *        *
*          *
*          *
*          *
 *        **
 **      *  *
* **    * * *
**  ****  **
 *  *   ***
 *******  *
 *    *   *
  *****   *
      *   *
       ***
"

# Turn all the strings into RawGraphics
# so they can be drawing easily with color

HAIR = RawGraphic.new(hair, PLAYER_HAIR)
HEAD = RawGraphic.new(head, PLAYER_SKIN)
EYES = RawGraphic.new(eyes, PLAYER_BORDER)
SHIRT = RawGraphic.new(shirt, PLAYER_SHIRT)
ARM_LEFT = RawGraphic.new(arm_left, PLAYER_SKIN)
ARM_RIGHT = RawGraphic.new(arm_right, PLAYER_SKIN)
PANTS = RawGraphic.new(pants, PLAYER_PANTS)
SHOES = RawGraphic.new(shoes, PLAYER_SHOES)
BORDER_IDLE = RawGraphic.new(border_idle, PLAYER_BORDER)
ARM_LEFT_FORWARD = RawGraphic.new(arm_left_forward, PLAYER_SKIN)
ARM_RIGHT_BACKWARD = RawGraphic.new(arm_right_backward, PLAYER_SKIN)
SHIRT_FORWARD = RawGraphic.new(shirt_forward, PLAYER_SHIRT)
LEFT_LEG_FORWARD = RawGraphic.new(left_leg_forward, PLAYER_PANTS)
RIGHT_LEG_BACKWARD = RawGraphic.new(right_leg_backward, PLAYER_PANTS)
SHOE = RawGraphic.new(shoe, PLAYER_SHOES)
BORDER_FORWARD = RawGraphic.new(border_forward, PLAYER_BORDER)
