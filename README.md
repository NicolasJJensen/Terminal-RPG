
  

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
9. [Copyright, Ethical and Social Issues](#copyright-ethical-and-social-Issues)
10. [License](#license) 



## Description

  

This game is a simple RPG game in which you can choose from a list of levels or enter a procedurally generated dungeon (maze) that you must find your way out of while fighting.

  

  

## Instructions for Use

  

  

### Installation

  Currently this game is optimized for iTerm2 other terminals are planned in the future, to install follow the instructions below.
  ***
***Step 1***
```
> cd ~/Library/Fonts && { curl -O 'http://strlen.com/files/square.ttf' ; cd -; }
```
***
***Step 2***
1. Go to iTerm2 -> Prefrences -> Profiles
2. Select the + on the bottom left and create a new profile called Terminal-RPG
3. Set the font to 'Square' and the size to 8
***
***Step 3***
Navigate to the directory the file was installed in and run
```
> bundle install
```
This will install the gems listed below
***
***Step 4***
Run the game by using the command
```
> ruby index.rb
```
> This command can take an option afterward which initializes the width and height of the maze displayed in the game, for example:
> ``> ruby index.rb 10``
> That will initialize the game to make 10 x 10 mazes instead of the standard 5 x 5

**Gems**
* Curses
* OS
* Win32-Sound
* Unit-Test
* Artii

### Running

  >Due to the game relying heavily on curses ability to display many colors this game will not display correctly on any system that does not have curses installed. 
  >Additionally it has been optimized for iTerm2
  >None of these issues will break the game however the experience may not be as intended if certain functionally is missing.

>Additionally because the terminal contains many different animations it may struggle to run on older machines so it is recommended to only attempt running the application if your computer has a 2.0GHz CPU and to not leave the game running for extensive periods of time.

## Features and Functionality

### Procedural Generation
This game uses random generation to create random mazes for the player to navigate through, this was accomplished using the *Recursive Backtracker* algorithm. While not the most effective or complex maze generator it works and is easier to implement than others. 
>In the future random seeding may be implemented to allow replaying the same Maze
  
### Multiple Levels
This game also has the option of multiple levels, currently these levels only change the theme and size of the maze, however it is planned for levels to have enemies of different varieties and traps.
  
### Custom Controls
In the game a menu has been added to allow users to change the controls that the game is used to make it more comfortable to play, this should work for any keys but they will be reset whenever the game is closed

### Use
This game will be used by firstly launching it with an option/switch for the difficulty(size) of the game. Once the game has been launched the user will be able to navigate menus to get help and alter the controls. Once the user feels comfortable they will be able to enter the Level Menu and select a level of their choice. This from this level the user will be able to exit by either walking out of the maze or opening the pause menu 'P' and selecting main menu from there.

## Motivation

### Purpose
The reason for creating this game was to challenge myself and see how far I could take my coding knowledge and improve my ability.
I settled for an animated game in the terminal because I felt it would be challenging to implement but still achievable within the 3-4 day time frame given.

### Audience
Due to the app mainly being focused on learning and improvement, the main audience for this is likely to be others looking to learn or get ideas for challenges themselves.

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
Trello was the main tool used for keeping track of progress and making sure functionality was needed and made sense for the context of the program, the use of the tags in Trello also allowed for a record of how long each task is estimated to take to complete as well as which tasks are for a minimum viable product and which items are simply for polish. 
The tags used are displayed below along with screenshots and descriptions of the checklists used in Trello.

<details>
<summary>

Tags Used:

</summary>

![Trello Tags](https://raw.githubusercontent.com/NicolasJJensen/Terminal-RPG/master/Trello/Trello%20Tags.png  "Trello Tags")

</details>

<details>
<summary>

Criteria Checklist:

</summary>

  This is the checklist for which items from the criteria sheet for the assessment have been completed

![Trello Criteria Sheet](https://raw.githubusercontent.com/NicolasJJensen/Terminal-RPG/master/Trello/Trello%20Criteria%20Sheet.png  "Trello Criteria Sheet")

</details>

<details>
<summary>

Incomplete Items:

</summary>

  This is the checklist for which items haven't been started and are important for the minimum viable product

![Trello Incomplete Items](https://raw.githubusercontent.com/NicolasJJensen/Terminal-RPG/master/Trello/Trello%20Incomplete%20Items.png  "Trello Incomplete Items")

</details>

<details>
<summary>

Nice to Have:

</summary>

  This is the checklist for items that are bonuses, they are not required for the minimum viable product but they are still nice features to add if there is time.

![Trello Nice To Have](https://raw.githubusercontent.com/NicolasJJensen/Terminal-RPG/master/Trello/Trello%20Nice%20To%20Have.png  "Trello Nice To Have")

</details>

<details>
<summary>

Currently Building:

</summary>

  This is the checklist for items that are still in the process of being built, this allows easy tracking of how many different things are in progress at one time and how difficult each one will be to complete at a glance. This is perfect for prioritization.

![Trello Current](https://raw.githubusercontent.com/NicolasJJensen/Terminal-RPG/master/Trello/Trello%20Current.png  "Trello Current")

</details>

<details>
<summary>

Complete Items:

</summary>

Finally there is the checklist of items that have already been completed for a record of what was done and when it was done.

![Trello Complete Items](https://raw.githubusercontent.com/NicolasJJensen/Terminal-RPG/master/Trello/Trello%20Complete%20Items.png  "Trello Complete Items")

</details>


### Testing
For testing the 'unit-test' gem was used for all classes early on. Unfortunately due to the nature of the 'curses' gem whenever curses was used it would cancel any tests so that functionality has been manually tested and is missing out on the security that 'unit-test' offers.

If you would like to run the tests yourself a file `all.rb` has been added for convenience. To run it simply use the command `> ruby -Itest test/all.rb` from the command line in the root directory

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

  

## License
