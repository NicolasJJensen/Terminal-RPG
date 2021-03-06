
# Development Log

## Original Plan

***Date:*** 3rd, September 2019

  

## Update 1

***Date:*** 3rd, September 2019

  

***Reason:*** Initial structure for menu made displaying a main menu and pause menu in game too complicated.

  

The initial structure of the menus was designed so that there was a menu controller which displayed the correct menu to the user. Once the user selected to play the game the menu would then pass control to a game controller which displayed and controlled the game.

  

This was going to cause issues with pausing and unpausing the menu in game and easily swapping backwards and forwards

  

***Changes Made:***

1. Instead of swapping between the two controllers the player now begins in a menu loop which launches the game loop.

  

> This makes returning to the main menu easier, as all that is required is breaking out of the to game loop which continues the main menu loop

2. The above method was also used to swap between different menus, allowing easy navigation forward and backwards through the system by launching and cancelling a new menu.

3. This was also used to nest the pause menu into the game loop, both displaying a menu that can be closed without causing issues with the game, and pausing the game in the process.

  

## Update 2

***Date:*** 4th, September 2019

  

***Reason:*** Half-way point update to keep track of development

  

***Notable Information:*** A large portion of the class structure has been completed at this point, however due to the classes being nested and very dependant on each other to properly function, this means that none of the display has been tested yet.

  

Fortunately the unit-test gem has allowed for a large portion of the functionality to be tested, and has already caught several potential issues.

  

Unfortunately due to the nature of curses (the gem being used to draw to the screen) it means that none of the drawing itself can be tested with unit-test, and any checks will have to wait until the rest of the core classes are completed.

## Update 3

***Date:*** 5th, September 2019

  

***Reason:*** Game mostly complete, due date approaching

  

***Notable Information:*** Fortunately during the development process very few errors were encountered due to the early testing and planning that was done. However despite all that, the game has still moved off course and several different features have been added while others have been put on hold.

The enemies and damage was placed on hold to instead focus on having a working maze generator that properly displayed in an interactive world. While developing this several small but time consuming additions were made to make the maze prettier.

Because of earlier planning the additions were structured in such a way that and similar future changes will be far faster and easier to do. However it still would have been more productive to ignore them and focus on more integral features.
