class Game {
  ArrayList<PImage> bgImgs;
  ArrayList<PImage> pokeball;
  ArrayList<Pokemon> pokemon;
  PImage victory;
  int bgNum, ballNum, pokeNum;
  int ballX, ballY;
  int side;
  int offset;
  Stage stage;
  float timer, timeMarker;

  Game(int side) {
    if (side == 1) {
      this.offset = 0;
    } else {
      this.offset = SCALE*6;
    }
    this.victory = loadImage("images/victory.png");

    this.bgImgs = new ArrayList<PImage>();
    bgImgs.add(loadImage("images/Background0.png"));
    bgImgs.add(loadImage("images/Background1.png"));
    bgImgs.add(loadImage("images/Background2.png"));
    this.bgNum = 0;
    
    this.pokeball = new ArrayList<PImage>();
    pokeball.add(loadImage("images/Pokeball0.png"));
    pokeball.add(loadImage("images/Pokeball1.png"));
    pokeball.add(loadImage("images/Pokeball2.png"));
    pokeball.add(loadImage("images/Pokeball3.png"));
    this.ballNum = 0;

    this.pokemon = new ArrayList<Pokemon>();
    this.pokemon.add(new Bulbasaur("images/Bulbasaur", 2, (int)random(0, 4), (int)random(0, 4), SCALE, offset));
    this.pokemon.add(new Charmander("images/Charmander", 2, (int)random(0, 4), (int)random(0, 4), SCALE, offset));
    this.pokemon.add(new Squirtle("images/Squirtle", 2, (int)random(0, 4), (int)random(0, 4), SCALE, offset));
    this.pokemon.add(new Pikachu("images/Pikachu", 1, (int)random(0, 4), (int)random(0, 4), SCALE, offset));
    this.pokeNum = 0;

    this.side = side;
    this.stage = Stage.START;
    
    this.timeMarker = millis();
  }

  void drawGame(String inputCode) {
    int[] hitLoc;
    switch(stage) {
    case START:
      drawBackground();
      if (millis() - timeMarker < 3000) {
        displayText("Catch all the pokemon");
      } else if (millis() - timeMarker < 6000) {
        displayText("To become the", "Pokemon Master!");
      } else if (millis() - timeMarker < 7000) {
        displayText("Ready?");
      } else if (millis() - timeMarker < 8000) {
        displayText("Get set...");
      } else if (millis() - timeMarker < 9000) {
        displayText("Go!");
      } else {
        stage = Stage.SETUP1;
      }
      break;
      
    case WIN:
      drawBackground();
      if (millis() - timeMarker < 1000) {
        pokeballSound.get(side-1).play();
        drawBackground();
        ballNum = 2;
        textBox("");
        drawPokeball();
      } else if (millis() - timeMarker < 6000) {
        pokeballSound.get(side-1).pause();
        pokeballSound.get(side-1).rewind();
        captureMusic.get(side-1).play();
        drawBackground();
        ballNum = 3;
        drawPokeball();
        textBox("You caught PIKACHU!");
      } else if (millis() - timeMarker < 8000) {
        captureMusic.get(side-1).pause();
        captureMusic.get(side-1).rewind();
        textBox("You have caught 'em all!");
        pokeNum = 4;
        drawVictory();
      } else {
        gameMusic.pause();
        gameMusic.rewind();
        victoryMusic.play();
        textBox("Congratulations Pokemon Master!");
        drawVictory();
      }
      drawProgress();
      break;
      
    case GAMEOVER:
      fill(2);
      rectMode(CENTER);
      rect(2*SCALE+offset, 2*SCALE, 4*SCALE, 4*SCALE);
      if (millis() - timeMarker < 3000) {
        textBox("Game Over");
      } else {
        textBox("Pokemon Caught: " + (pokeNum));
      }
      drawProgress();
      break;
      
    case SETUP1:
      drawBackground();
      stage = Stage.STAGE1;
      break;

    case STAGE1:
      drawBackground();
      pokemon.get(pokeNum).move();
      pokemon.get(pokeNum).drawPokemon();
      textBox("A wild BULBASAUR appeared!");
      hitLoc = checkHit(inputCode);

      if (hitLoc != null) {
        println("Player " + side + ": " + hitLoc[0] + ", " + hitLoc[1]);
        stage = Stage.SETUP2;
        timeMarker = millis();
        ballX = hitLoc[0];
        ballY = hitLoc[1];
      }
      drawProgress();
      break;

    case SETUP2:
      if (millis() - timeMarker < 1000) {
        pokeballSound.get(side-1).play();
        drawBackground();
        ballNum = 2;
        drawPokeball();
        drawProgress();
      } else if (millis() - timeMarker < 6000) {
        pokeballSound.get(side-1).pause();
        pokeballSound.get(side-1).rewind();
        captureMusic.get(side-1).play();
        drawBackground();
        ballNum = 3;
        drawPokeball();
        textBox("You caught BULBASAUR!");
        drawProgress();
      } else if (millis() - timeMarker < 8000) {
        captureMusic.get(side-1).pause();
        captureMusic.get(side-1).rewind();
        bgNum = 1;
        drawBackground();
        pokeNum = 1;
        pokemon.get(pokeNum).drawPokemon();
        textBox("A wild CHARMANDER appeared!");
        drawProgress();
      } else {
        drawBackground();
        stage = Stage.STAGE2;
        drawProgress();
      }
      break;

    case STAGE2:
      drawBackground();
      pokemon.get(pokeNum).move();
      pokemon.get(pokeNum).drawPokemon();
      textBox("CHARMANDER used dig!");
      hitLoc = checkHit(inputCode);

      if (hitLoc != null) {
        println("Player " + side + ": " + hitLoc[0] + ", " + hitLoc[1]);
        stage = Stage.SETUP3;
        timeMarker = millis();
        ballX = hitLoc[0];
        ballY = hitLoc[1];
      }
      drawProgress();
      break;

    case SETUP3:
      if (millis() - timeMarker < 1000) {
        pokeballSound.get(side-1).play();
        drawBackground();
        ballNum = 2;
        drawPokeball();
        drawProgress();
      } else if (millis() - timeMarker < 6000) {
        pokeballSound.get(side-1).pause();
        pokeballSound.get(side-1).rewind();
        captureMusic.get(side-1).play();
        drawBackground();
        ballNum = 3;
        drawPokeball();
        textBox("You caught CHARMANDER!");
        drawProgress();
      } else if (millis() - timeMarker < 8000) {
        captureMusic.get(side-1).pause();
        captureMusic.get(side-1).rewind();
        bgNum = 2;
        drawBackground();
        pokeNum = 2;
        pokemon.get(pokeNum).drawPokemon();
        textBox("A wild SQUIRTLE appeared!");
        drawProgress();
      } else {
        drawBackground();
        stage = Stage.STAGE3;
        pokemon.get(pokeNum).imgCode = 1;
        drawProgress();
      }
      break;

    case STAGE3:
      drawBackground();
      pokemon.get(pokeNum).move();
      pokemon.get(pokeNum).drawPokemon();
      textBox("SQUIRTLE used protect!");
      hitLoc = checkHit(inputCode);

      if (hitLoc != null) {
        println("Player " + side + ": " + hitLoc[0] + ", " + hitLoc[1]);
        stage = Stage.SETUP4;
        timeMarker = millis();
        ballX = hitLoc[0];
        ballY = hitLoc[1];
      }
      drawProgress();
      break;

    case SETUP4:
      if (millis() - timeMarker < 1000) {
        pokeballSound.get(side-1).play();
        drawBackground();
        ballNum = 2;
        drawPokeball();
        drawProgress();
      } else if (millis() - timeMarker < 6000) {
        pokeballSound.get(side-1).pause();
        pokeballSound.get(side-1).rewind();
        captureMusic.get(side-1).play();
        drawBackground();
        ballNum = 3;
        drawPokeball();
        textBox("You caught SQUIRTLE!");
        drawProgress();
      } else if (millis() - timeMarker < 8000) {
        captureMusic.get(side-1).pause();
        captureMusic.get(side-1).rewind();
        bgNum = 0;
        drawBackground();
        pokeNum = 3;
        pokemon.get(pokeNum).drawPokemon();
        textBox("A wild PIKACHU appeared!");
        drawProgress();
      } else {
        drawBackground();
        ((Pikachu)pokemon.get(pokeNum)).randomize();
        stage = Stage.STAGE4;
        drawProgress();
      }
      break;

    case STAGE4:
      drawBackground();
      pokemon.get(pokeNum).move();
      ((Pikachu)pokemon.get(pokeNum)).drawAll();
      textBox("PIKACHU used double team!");
      hitLoc = checkHit(inputCode);

      if (hitLoc != null) {
        println("Player " + side + ": " + hitLoc[0] + ", " + hitLoc[1]);
        stage = Stage.WIN;
        timeMarker = millis();
        ballX = hitLoc[0];
        ballY = hitLoc[1];
      }
      drawProgress();
      break;
    }
  }

  void drawBackground() {
    imageMode(CENTER);
    pushMatrix();
    translate(SCALE*2+offset, SCALE*2);
    if (offset == 0) { // If on left side
      rotate(-HALF_PI);
    } else { // If on right side
      rotate(HALF_PI);
    }
    image(bgImgs.get(bgNum), 0, 0, SCALE*4, SCALE*4);
    popMatrix();
  }

  void textBox(String msg) {
    pushMatrix();
    if (offset == 0) { // If on left side
      translate(SCALE*4, SCALE*4);
      rotate(-HALF_PI);
    } else { // If on right side
      translate(offset, 0);
      rotate(HALF_PI);
    }

    rectMode(CORNER);
    fill(255);
    stroke(0);
    rect(0, 0, SCALE*4, SCALE);

    textAlign(LEFT, BOTTOM);
    fill(0);
    textSize(SCALE * 3/10);
    text(msg, SCALE/10, SCALE*3/10);

    popMatrix();
  }

  void displayText(String msg) {
    pushMatrix();
    if (offset == 0) { // If on left side
      translate(SCALE*2, SCALE*2);
      rotate(-HALF_PI);
    } else { // If on right side
      translate(SCALE*2 + offset, SCALE*2);
      rotate(HALF_PI);
    }

    textAlign(CENTER, CENTER);
    fill(255);
    textSize(SCALE * 1/2);
    text(msg, 0, 0);

    popMatrix();
  }

  void displayText(String msg1, String msg2) {
    pushMatrix();
    if (offset == 0) { // If on left side
      translate(SCALE*2, SCALE*2);
      rotate(-HALF_PI);
    } else { // If on right side
      translate(SCALE*2 + offset, SCALE*2);
      rotate(HALF_PI);
    }

    textAlign(CENTER, CENTER);
    fill(255);
    textSize(SCALE * 1/2);
    text(msg1, 0, SCALE/-2);
    text(msg2, 0, SCALE/2);

    popMatrix();
  }
  
  void drawProgress() {
    pushMatrix();
    if (offset == 0) { // If on left side
      translate(SCALE*2, SCALE*2);
      rotate(-HALF_PI);
    } else { // If on right side
      translate(SCALE*2 + offset, SCALE*2);
      rotate(HALF_PI);
    }
    
    for (int i = 0; i < 4; i++) {
      ellipseMode(CENTER);
      fill(0);
      ellipse((int)(7.0/4*SCALE - SCALE/4.0*i), (int)(3.0*SCALE-SCALE/9.0), (int)(SCALE*1.0/12), (int)(SCALE*1.0/12));
    }
    
    for (int i = 0; i < pokeNum; i++) {
      image(pokeball.get(3), (int)(7.0/4*SCALE - SCALE/4.0*i), (int)(3.0*SCALE-SCALE/4.0), (int)(SCALE*5.0/12), (int)(SCALE*5.0/12));
    }
    popMatrix();
  }

  int[] checkHit(String inputCode) {
    if (inputCode == null || inputCode.isEmpty()) {
      return null;
    }

    int loc;
    if (Character.isUpperCase(inputCode.charAt(0))) {
      loc = inputCode.charAt(0) - 'A';
    } else {
      loc = inputCode.charAt(0) - 'a';
    }

    Pokemon mon = pokemon.get(pokeNum);
    if ((mon instanceof Squirtle) && ((Squirtle)mon).isShielded() && loc % 4 == mon.gridX && loc / 4 == mon.gridY) {
      ((Squirtle)mon).shielded = false;
      ((Squirtle)mon).hit = true;
    } else if (mon.isTargetable() && loc % 4 == mon.gridX && loc / 4 == mon.gridY) {
      mon.caught();
      int[] hit = {mon.gridX, mon.gridY};
      return hit;
    } else if ((mon instanceof Pikachu)) {
      ArrayList<Integer> hitLoc = new ArrayList<Integer>();
      hitLoc.add(loc % 4);
      hitLoc.add(loc / 4);
      if (((Pikachu)mon).fakes.contains(hitLoc)) {
        ((Pikachu)mon).fakes.remove(hitLoc);
      }
    }
    return null;
  }

  void gameOver() {
    stage = Stage.GAMEOVER;
    timeMarker = millis();
  }
  
  void drawPokeball() {
    imageMode(CENTER);
    pushMatrix();
    translate(ballX*SCALE+offset+SCALE/2, ballY*SCALE+SCALE/2);
    if (offset == 0) { // If on left side
      rotate(-HALF_PI);
    } else { // If on right side
      rotate(HALF_PI);
    }
      
    image(pokeball.get(ballNum), 0, 0, SCALE, SCALE);
    popMatrix();
  }
  
  void drawVictory() {
    pushMatrix();
    if (offset == 0) { // If on left side
      translate(SCALE*2, SCALE*2);
      rotate(-HALF_PI);
    } else { // If on right side
      translate(SCALE*2 + offset, SCALE*2);
      rotate(HALF_PI);
    }
    
    image(victory, 0, 0, 4*SCALE, 4*SCALE);
    popMatrix();
  }
}
