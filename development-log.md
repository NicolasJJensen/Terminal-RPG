# Development Log
## Original Plan
***Date:*** 3rd, September 2019

## Update 1
***Date:*** 3rd, September 2019

***Issue:*** Initial structure for menu made displaying a main menu and pause menu in game too complicated.

The initial structure of the menus was designed so that there was a menu controller which displayed the correct menu to the user. Once the user selected to play the game the menu would then pass control to a game controller which displayed and controlled the game. 

This was going to cause issues with pausing and unpausing the menu in game and easily swapping backwards and forwards

***Changes Made:*** 
1. Instead of swapping between the two controllers the player now begins in a menu loop which launches the game loop.
    > This makes returning to the main menu easier, as all that is required is breaking out of the to game loop which continues the main menu loop
2. The above method was also used to swap between different menus, allowing easy navigation forward and backwards through the system by launching and cancelling a new menu.
3. This was also used to nest the pause menu into the game loop, both displaying a menu that can be closed without causing issues with the game, and pausing the game in the process.
