abstract class Pokemon {
  ArrayList<PImage> imgs;
  int imgCode;
  float x, y;
  int gridX, gridY;
  float size;
  boolean targetable, visible, caught;
  int offset;
  
  Pokemon(String filePath, int imgCount, int gridX, int gridY, float size, int offset) {
    this.imgs = new ArrayList<PImage>();
    for (int i = 0; i < imgCount; i++) {
      this.imgs.add(loadImage(filePath+i+".png"));
    }
    this.imgCode = 0;
    this.gridX = gridX;
    this.gridY = gridY;
    this.offset = offset;
    updateLocation();
    
    this.size = size;
    this.targetable = true;
    this.visible = true;
    this.caught = false;
  }
  
  void drawPokemon() {
    if (visible) {
      imageMode(CENTER);
      pushMatrix();
      translate(x,y);
      if (offset == 0) { // If on left side
        rotate(-HALF_PI);
      } else { // If on right side
        rotate(HALF_PI);
      }
      
      image(imgs.get(imgCode), 0, 0, size, size);
      popMatrix();
    }
  }
  
  void updateLocation() {
    this.x = SCALE/2 + gridX*SCALE + offset;
    this.y = SCALE/2 + gridY*SCALE;
  }
  
  int gridXtoX(int gX) {
    return SCALE/2 + gX*SCALE + offset;
  }
  
  int gridYtoY(int gY) {
    return SCALE/2 + gY*SCALE;
  }
  
  boolean isTargetable() {
    return targetable;
  }
  
  void targetOn() {
    this.targetable = true;
  }
  
  void targetOff() {
    this.targetable = false;
  }
  
  void caught() {
    this.caught = true;
    this.targetable = false;
    this.visible = false;
  }
  
  abstract void move();
}
