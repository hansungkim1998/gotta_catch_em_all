class Squirtle extends Pokemon {
  float cooldown; // In milliseconds
  float timeMarker; // In milliseconds
  boolean shielded, hit;
  
  Squirtle(String filePath, int imgCount, int gridX, int gridY, float size, int offset) {
    super(filePath, imgCount, gridX, gridY, size, offset);
    this.cooldown = 5000;
    this.shielded = false;
    this.hit = false;
  }
  
  void move() {
    if (!caught) {
      if (targetable && millis() - timeMarker >= cooldown) { // If cooldown is over
        targetable = false;
        shielded = true;
        imgCode = 1;
        
        if (random(0,1) < 0.5) { // Move vertically
          gridY += (int)random(-2,2);
        } else { // Move horizontally
          gridX += (int)random(-2,2);
        }
        
        // Check out of bounds
        if (gridX < 0) {
          gridX = 0;
        } else if (gridX > 3) {
          gridX = 3;
        }
        if (gridY < 0) {
          gridY = 0;
        } else if (gridY > 3) {
          gridY = 3;
        }
        
        updateLocation();
        
        timeMarker = millis(); // Initiate cooldown
      } else if (hit) { // If hit while shielded
        targetable = true;
        shielded = false;
        hit = false;
        imgCode = 0;
        
        timeMarker = millis();
      } 
    }
  }
  
  boolean isShielded() {
    return shielded;
  }
}
