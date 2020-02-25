# Gotta Catch 'em All
## Disclaimer
***Disclaimer: The Pokémon name, trademark and franchise are all Copyright to Nintendo, Pokémon, Creatures Inc and Game Freak inc. This game is intended as a Fan Game and a course project, and claims no rights or association with aforementioned companies or their products.***

## Description
Gotta Catch 'em All is an interactive Pokémon-themed game inspired by foursquare and the Pokémon games. The game brings together the active aspects from the well-known playground game of foursquare and the familiarity of Pokémon to create a fun, interactive experience that brings back the child in all of us.

This project was done with Joy Brown and Shiwen Jiang for ID 3510: Interactive Products in Fall 2019 at the Georgia Institute of Technology. The original presentation for the project can be found [here](Gotta\ Catch\ \'Em\ All.pdf).

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
