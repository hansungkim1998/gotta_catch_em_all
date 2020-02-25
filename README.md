# Gotta Catch 'em All
## Requirements
1. Install [Processing](https://processing.org/download/) and required packages.
   - Install [Minim](http://code.compartmental.net/tools/minim/) for sound.
2. Install [Arduino IDE](https://www.arduino.cc/en/main/software) and required packages.
   - Install [Keypad Library for Arduino](https://playground.arduino.cc/Code/Keypad/).
## (Optional) Building the Contact Sensor Grid
## Running the Game
1. (Optional) Connect and set up the contact sensor grid.
   - Open [PokemonGame.pde](PokemonGame/PokemonGame.pde) using Processing.
     - On line 21, modify the variable from `usePort = false` to `usePort = true`
   - Upload code and connect to Arduino
     - Upload [InputPad.ino](PokemonGame/InputPad/InputPad.ino) to the Arduino.
     - Keep the Arduino connected to the computer
