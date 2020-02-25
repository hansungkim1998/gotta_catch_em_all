class Board {
  Game game1;
  Game game2;
  boolean reset, play1, play2;
  float timeMarker;
  PImage cover;
  
  Board() {
    this.reset = false;
    this.play1 = false;
    this.play2 = false;
    this.cover = loadImage("images/cover.png");
  }
  
  void drawBoard(String inputCode) {
    StringBuilder input1 = new StringBuilder();
    StringBuilder input2 = new StringBuilder();
    for (int i = 0; i < inputCode.length(); i++) {
      if (Character.isUpperCase(inputCode.charAt(i))) {
        input1.append(inputCode.charAt(i));
      } else if (Character.isLowerCase(inputCode.charAt(i))) {
        input2.append(inputCode.charAt(i));
      }
    }
    
    if (play1 && play2) {
      if (!reset && game1.stage == Stage.WIN) {
        game2.gameOver();
        reset = true;
        timeMarker = millis();
      } else if (!reset && game2.stage == Stage.WIN) {
        game1.gameOver();
        reset = true;
        timeMarker = millis();
      }
      
      background(255);
      game1.drawGame(input1.toString());
      game2.drawGame(input2.toString());
      
      if (reset && millis() - timeMarker > 18000) {
        game1 = new Game(1);
        game2 = new Game(2);
        reset = false;
        play1 = false;
        play2 = false;
        victoryMusic.pause();
        victoryMusic.rewind();
      }
    } else {
      introMusic.play();
      
      if (!input1.toString().isEmpty()) {
        play1 = true;
      }
      if (!input2.toString().isEmpty()) {
        play2 = true;
      }
      
      background(255);
      imageMode(CENTER);
      image(cover, SCALE*5, SCALE*2, width, height);
      
      textAlign(CENTER, CENTER);
      fill(0);
      textSize(SCALE/3);
      if (play1) {
        text("Player 1: Ready", SCALE, SCALE/2);
      } else {
        text("Player 1: ", SCALE, SCALE/2);
      }
      if (play2) {
        text("Player 2: Ready", SCALE*9, SCALE/2);
      } else {
        text("Player 2: ", SCALE*9, SCALE/2);
      }
      
      if (play1 && play2) {
        game1 = new Game(1);
        game2 = new Game(2);
        introMusic.pause();
        introMusic.rewind();
        gameMusic.loop();
      }
    }
  }
}
