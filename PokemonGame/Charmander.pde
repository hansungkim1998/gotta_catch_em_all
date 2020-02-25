class Charmander extends Pokemon {
  float cooldown; // In milliseconds
  float timeMarker; // In milliseconds
  float timer;
  
  Charmander(String filePath, int imgCount, int gridX, int gridY, float size, int offset) {
    super(filePath, imgCount, gridX, gridY, size, offset);
    cooldown = 3000;
    timer = 1500;
    timeMarker = millis();
  }
  
  void move() {
    if (!caught) {
      if (targetable && millis() - timeMarker >= cooldown) { // If cooldown is over
        targetable = false;
        imgCode = 1;
        
        timeMarker = millis(); // Initiate cooldown
      } else if (!targetable && millis() - timeMarker >= timer) { // If move is over
        imgCode = 0;
        targetable = true;
        
        gridX = (int)random(0,4);
        gridY = (int)random(0,4);
        updateLocation();
        
        timeMarker = millis();
      } 
    }
  }
}
