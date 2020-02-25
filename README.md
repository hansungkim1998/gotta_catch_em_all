# Gotta Catch 'em All
## Disclaimer
***Disclaimer: The Pokémon name, trademark and franchise are all Copyright to Nintendo, Pokémon, Creatures Inc and Game Freak inc. This game is intended as a Fan Game and a course project, and claims no rights or association with aforementioned companies or their products.***

## Description
Gotta Catch 'em All is an interactive Pokémon-themed game inspired by foursquare and the Pokémon games. The game brings together the active aspects from the well-known playground game of foursquare and the familiarity of Pokémon to create a fun, interactive experience that brings back the child in all of us.

This project can be run just on the computer with a keyboard as input, but for the full emersive experience, the optional components are necessary.

This project was done with Joy Brown and Shiwen Jiang for ID 3510: Interactive Products in Fall 2019 at the Georgia Institute of Technology. The original presentation for the project can be found [here](Presentation.pdf) and the video can be found [here](https://drive.google.com/open?id=1EMmAZx8vx8kNBeF9AtVb7qij_3s1D3JW).

## Requirements
### Devices
1. Computer (macOS or Windows)
2. (Optional) Arduino Uno
3. (Optional) Projector

### Installations
1. Install [Processing](https://processing.org/download/) and required packages.
   - Install [Minim](http://code.compartmental.net/tools/minim/) for sound.
2. (Optional) Install [Arduino IDE](https://www.arduino.cc/en/main/software) and required packages.
   - Install [Keypad Library for Arduino](https://playground.arduino.cc/Code/Keypad/).
   
## (Optional) Building the Contact Sensor Grid
### Materials
- 3x [4ft x 8ft White Tile Boards](https://www.homedepot.com/p/EUCATILE-32-sq-ft-96-in-x-48-in-Hardboard-Thrifty-White-Tile-Board-HDDPTW48/205995949)
- 3x [2 inch Copper Tape](https://www.amazon.com/gp/product/B07C6YLNYL/ref=ppx_yo_dt_b_asin_title_o09_s00?ie=UTF8&psc=1)
- 2x [Rubber Playground Balls](https://www.amazon.com/gp/product/B0000C8648/ref=ppx_yo_dt_b_asin_title_o00_s00?ie=UTF8&psc=1)
- 1x Black Paint
- 1x White Paint
- 2x Paintbrushes

### Tools
- Woodworking Tools
  - Bandsaw
  - Tablesaw
- Electronics Equipment
  - Soldering iron
  - Wiring kit (wires, wire strippers, electrical tape, solder, etc.)
- Basic Tools
  - Scissors
  - Glue gun

### How it works
<img src="touchpad_demo.gif" width="500">

### Construction Instructions

## Running the Game
1. (Optional) Connect and set up the contact sensor grid.
   - Open [PokemonGame.pde](PokemonGame/PokemonGame.pde) using Processing.
     - On line 21, modify the variable from `usePort = false` to `usePort = true`
   - Connect Contact Sensor Grid to Arduino
   - Upload code and connect to Arduino
     - Upload [InputPad.ino](PokemonGame/InputPad/InputPad.ino) to the Arduino.
     - Keep the Arduino connected to the computer
   - Set up projector
     - Connect the computer to the projector
     - Orient and change the settings on the projector to display onto the contact sensor grid.
     
2. Run the game through Processing
   - Open [PokemonGame.pde](PokemonGame/PokemonGame.pde) using Processing.
   - Run by pressing Sketch > Present or by pressing the shortcut `Shift + Command + R`
