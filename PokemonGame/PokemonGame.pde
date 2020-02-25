import java.util.HashSet;
import processing.serial.*;
import ddf.minim.*;

Minim minim;
AudioPlayer introMusic;
ArrayList<AudioPlayer> captureMusic;
AudioPlayer victoryMusic;
ArrayList<AudioPlayer> pokeballSound;
AudioPlayer gameMusic;

Serial serial;  // Create object from Serial class
String val;     // Data received from the serial port

final int SCALE = 100;
PFont gameFont;

Board board;
String inputCode;

boolean usePort = true;

void setup() {
  if (usePort) {
    printArray(Serial.list());
    
    String portName = Serial.list()[4]; // Change the right number based on arduino
    serial = new Serial(this, portName, 9600);
  }
  
  size(1000, 400); // Manually adjust to be 10*SCALE and 4*SCALE
  frameRate(30);
  board = new Board();
  inputCode = "";
  
  // Import font and initialize game
  gameFont = createFont("font/pokemon_pixel_font.ttf", 50);
  textFont(gameFont);
  
  // Import game sounds and music
  minim = new Minim(this);
  introMusic = minim.loadFile("audio/intro.mp3");
  captureMusic = new ArrayList<AudioPlayer>();
  captureMusic.add(minim.loadFile("audio/capture.mp3"));
  captureMusic.add(minim.loadFile("audio/capture.mp3"));
  victoryMusic = minim.loadFile("audio/victory.wav");
  pokeballSound = new ArrayList<AudioPlayer>();
  pokeballSound.add(minim.loadFile("audio/pokeball.wav"));
  pokeballSound.add(minim.loadFile("audio/pokeball.wav"));
  gameMusic = minim.loadFile("audio/game.mp3");
}

void draw() {
  if (usePort) {
    inputCode = getValue();
  }
  
  if (inputCode == null) {
    inputCode = "";
  }
  
  println(inputCode);
  
  board.drawBoard(inputCode);
  
  drawHits(inputCode);
}

String getValue() {
  if (serial.available() > 0) {
    String str = serial.readStringUntil('\n');
    
    if (str != null) {
      str = str.trim();
    }
    return str;
  }
  return null;
}

void drawHits(String inputCode) {
  if (inputCode != null && !inputCode.isEmpty()) {
    int hitX, hitY;
    if (Character.isUpperCase(inputCode.charAt(0))) {
      hitX = (inputCode.charAt(0) - 'A') % 4;
      hitY = (inputCode.charAt(0) - 'A') / 4;
      
      rectMode(CENTER);
      fill(255,0,0);
      rect(hitX*SCALE+SCALE/2, hitY*SCALE+SCALE/2, SCALE, SCALE);
    } else {
      hitX = (inputCode.charAt(0) - 'a') % 4;
      hitY = (inputCode.charAt(0) - 'a') / 4;
      
      rectMode(CENTER);
      fill(255,0,0);
      rect(hitX*SCALE+SCALE/2+SCALE*6, hitY*SCALE+SCALE/2, SCALE, SCALE);
    }
  }
}

/*
 * For testing purposes only
 */
void keyPressed() {
  if ((key >= 'a' && key <= 'p') || (key >= 'A' && key <= 'P')) {
    inputCode = "" + key;
  }
}

/*
 * For testing purposes only
 */
void keyReleased() {
  if ((key >= 'a' && key <= 'p') || (key >= 'A' && key <= 'P')) {
    inputCode = "";
  }
}
