class Bulbasaur extends Pokemon {
  float cooldown; // In milliseconds
  float timeMarker; // In milliseconds
  
  Bulbasaur(String filePath, int imgCount, int gridX, int gridY, float size, int offset) {
    super(filePath, imgCount, gridX, gridY, size, offset);
    cooldown = 500;
    timeMarker = millis();
  }
  
  void move() {
    if (!caught) {
      if (millis() - timeMarker >= cooldown) { // If cooldown is over
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
      }
    }
  }
}
