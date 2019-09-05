# frozen_string_literal: true

require_relative '../../raw_graphic'
require_relative '../../shape'
require_relative '../../Colors/character'

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

border = "
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

HAIR = RawGraphic.new(hair, PLAYER_HAIR)
HEAD = RawGraphic.new(head, PLAYER_SKIN)
EYES = RawGraphic.new(eyes, PLAYER_BORDER)
SHIRT = RawGraphic.new(shirt, PLAYER_SHIRT)
ARM_LEFT = RawGraphic.new(arm_left, PLAYER_SKIN)
ARM_RIGHT = RawGraphic.new(arm_right, PLAYER_SKIN)
PANTS = RawGraphic.new(pants, PLAYER_PANTS)
SHOES = RawGraphic.new(shoes, PLAYER_SHOES)
BORDER = RawGraphic.new(border, PLAYER_BORDER)
