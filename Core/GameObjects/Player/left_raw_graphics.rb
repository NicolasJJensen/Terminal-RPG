# frozen_string_literal: true

require_relative '../../raw_graphic'
require_relative '../../shape'
require_relative '../../Colors/character'

# Once again a list of strings for the graphics

hair = "
   ****
 ********
 ********
* ********
   *******
    ** ***
        **
"

head = "
*********
*********
*********
*********
 *******
  *****
"

eyes = "
*
*
"

shirt = "
*  **
    *
    *
"

arm_idle = "
**
**
"

pants = "
*  *
"

shoe = "
****
"

border_idle = "
    ****
  **    **
 *        *
 *        *
*          *
 *         *
 *         *
 *         *
  *       *
   *     *
    *****
   * **  *
   **  * *
    *  * *
   * ** *
   *    *
    ****
"

# They were split up here because it made it easier to keep track of
# which graphics for which animation has been done

HAIR = RawGraphic.new(hair, PLAYER_HAIR)
HEAD = RawGraphic.new(head, PLAYER_SKIN)
EYES = RawGraphic.new(eyes, PLAYER_BORDER)
SHIRT = RawGraphic.new(shirt, PLAYER_SHIRT)
ARM_IDLE = RawGraphic.new(arm_idle, PLAYER_SKIN)
PANTS = RawGraphic.new(pants, PLAYER_PANTS)
SHOE = RawGraphic.new(shoe, PLAYER_SHOES)
BORDER_IDLE = RawGraphic.new(border_idle, PLAYER_BORDER)

shirt_moving = "
 ***
*****
"

arm_forward = "
**
*
"

pants_moving = "
*  **
"

shoes = "
**      *
 **    **
"

border_moving = "
    ****
  **    **
 *        *
 *        *
*          *
 *         *
 *         *
 *         *
  *       *
  **    **
 *  ****  *
 * *   *  *
 **     **
*  * *  * *
 *  * **  *
  **    **
"

SHIRT_MOVING = RawGraphic.new(shirt_moving, PLAYER_SHIRT)
ARM_MOVING = RawGraphic.new(arm_forward, PLAYER_SKIN)
PANTS_MOVING = RawGraphic.new(pants_moving, PLAYER_PANTS)
SHOES = RawGraphic.new(shoes, PLAYER_SHOES)
BORDER_MOVING = RawGraphic.new(border_moving, PLAYER_BORDER)
