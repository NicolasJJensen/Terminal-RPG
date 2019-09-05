
  

# Terminal-RPG

  

## Contents

1. [Description](#description)
2. [Instructions](#instructions-for-use)
3. [Features and Functionality](#features-and-functionality)
4. [Motivation](#motivation)
5. [Code Structure](#code-structure)
6. [Design and Planning Process](#design-and-planning-process)
7. [Build Status](#build-status)
8. [Accessibility](#accessibility)
9. [Copyright, Ethical and Social Issues](#copyright,-ethical-and-social-Issues)
10. [License](#license) 



## Description

  

This game is a simple RPG game in which you can choose from a list of levels or enter a procedurally generated dungeon (maze) that you must find your way out of while fighting.

  

  

## Instructions for Use

  

  

### Installation

  

First navigate to the directory the game was downloaded to

  

  

```> bundle install```

  

  

**Gems**

  

* curses

  

* random

  

  

### Running

  >Due to the game relying heavily on curses ability to display many colors this game will not display correctly on any system that does not have curses installed. 
  >Additionally it has been optimized for iTerm2
  >None of these issues will break the game however the experience may not be as intended if certain functionaily is missing

**Command**

  

```ruby index.js```
  
  

## Features and Functionality

  

### Procedural Generation
This game uses random generation to create random mazes for the player to navigate through, this was accomplished using the *Recursive Backtracker* algorithm. While not the most effective or complex maze generator it works and is easier to implement than others. 
>In the future random seeding may be implemented to allow replaying the same Maze
  

### Multiple Levels
This game also has the option of multiple levels, currently these levels only change the theme and size of the maze, however it is planned for levels to have enemies of different varieties and traps.
  

### Custom Controls

  In the game a menu has been added to allow users to change the controls that the game is used to make it more comfortable to play, this should work for any keys but they will be reset whenever the game is closed

  

## Motivation

  

The reason for creating this game was to challenge myself and see how far I could take my coding knowledge and improve my ability.
I settled for an animated game in the terminal because I felt it would be challenging to implement but still achievable within the 3-4 day time frame given.

  

  

## Code Structure

  

### UML entity relationship diagram

<details>

<summary>

Structure of GameObject class:

</summary>

  

![Game Object UML Diagram](https://raw.githubusercontent.com/NicolasJJensen/Terminal-RPG/master/Diagrams/Game%20Object%20UML.png  "Game Object UML Diagram")

>This class is the core of all interactions in the game

</details>

  

<details>

<summary>

Structure of entire project:

</summary>

  

![Main Structure UML](https://raw.githubusercontent.com/NicolasJJensen/Terminal-RPG/master/Diagrams/Main%20Structure%20UML.png  "Main Structure UML")

</details>

  

***

  

### Data Flow Diagram

  

<details>

<summary>

Data Flow Diagram:

</summary>

  

![Data Flow Diagram](https://raw.githubusercontent.com/NicolasJJensen/Terminal-RPG/master/Diagrams/Data%20Flow%200409.png  "Data Flow Diagram")

</details>

  

***

  

### Flow Charts

  

<details>

<summary>

Main Menu Process:

</summary>

  

![Main Menu Process](https://raw.githubusercontent.com/NicolasJJensen/Terminal-RPG/master/Diagrams/Main%20Menu%20Flowchart.png  "Main Menu Process")

</details>

  

<details>

<summary>

Help Menu Process:

</summary>

  

![Help Menu Process](https://raw.githubusercontent.com/NicolasJJensen/Terminal-RPG/master/Diagrams/Help%20Menu%20Flowchart.png  "Help Menu Process")

</details>

  

<details>

<summary>

Controls Menu Process:

</summary>

  

![Controls Menu Process](https://raw.githubusercontent.com/NicolasJJensen/Terminal-RPG/master/Diagrams/Control%20Menu%20Flowchart.png  "Controls Menu Process")

</details>

  

<details>

<summary>

Level Menu Process:

</summary>

  

![Level Menu Process](https://raw.githubusercontent.com/NicolasJJensen/Terminal-RPG/master/Diagrams/Level%20Menu%20Flowchart.png  "Level Menu Process")

</details>

  

<details>

<summary>

Game Loop Process:

</summary>

  

![Game Loop Process](https://raw.githubusercontent.com/NicolasJJensen/Terminal-RPG/master/Diagrams/Game%20Loop%20Flowchart.png  "Game Loop Process")

</details>

  

<details>

<summary>

Draw Screen Process:

</summary>

  

![Draw Screen Process](https://raw.githubusercontent.com/NicolasJJensen/Terminal-RPG/master/Diagrams/Drawing%20Logic%20Flowchart.png  "Draw Screen Process")

</details>

  

<details>

<summary>

User Input Controller Process:

</summary>

  

![User Input Controller Process](https://raw.githubusercontent.com/NicolasJJensen/Terminal-RPG/master/Diagrams/User%20Input%20Flowchart.png  "User Input Controller Process")

</details>

  

<details>

<summary>

Game Menu Process:

</summary>

  

![Game Menu Process](https://raw.githubusercontent.com/NicolasJJensen/Terminal-RPG/master/Diagrams/Game%20Loop%20Flowchart.png  "Game Menu Process")

</details>

  

## Design and Planning Process

  

  

### Trello

  

### Testing

  

### Timeline

  

  

## Build Status

  

### Complete
* Menu System
* Colored Graphics
* Animations
* Randomly Generated Mazes
* Theming

  

### In Progress
* Enemies
* Weapons and Attacks
* Seeding Levels
* Sound

  

### Planned
* Traps
* Ability to Swap Weapons
* Welcome, Congratulations, and Goodbye Screens

  

  

## Accessibility

  

### Concerns
Two major concerns for the accessibility of this game are;

1. Firstly that it is currently optimized for 1 Terminal only availiable on MacOS and Linux slightly limiting those on Windows and,

3. Due to the fact that the game uses so many animations and colors in the terminal it will be extremely difficult to run on older systems

  

### Considerations
Some of the considerations taken into account during the creation of the game were 
1. The font size in the menus was originally too small and extremely difficult to see, so the 'artii' gem was added to make the text large enough to read

3. The game was planned to have some violence implemented however if added it will not contain blood to keep the rating suitable for the majority of people.
  

  

## Copyright, Ethical and Social Issues

  

### Ethical Concerns
As stated above one of the ethical concerns this game faces is the depiction of violence and how that needs to be addressed, some plans have already been made to keep the level of violence at a suitable level.
However warnings will also need to be added to notify and potential users about the style and contents of the game.

Another ethical concern is the use of the player sprite in the game, it has been copied from online for testing. But it is possible that use of the character is copyrighted.
  

### Social Issues
Once again the style of this game means that is may cross over into the social issue of violence in games and whether that causes increased aggression in those who play it. This has already been discussed above.

  

## Licence
