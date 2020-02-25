class Pikachu extends Pokemon {
  HashSet<ArrayList<Integer>> fakes;
  
  Pikachu(String filePath, int imgCount, int gridX, int gridY, float size, int offset) {
    super(filePath, imgCount, gridX, gridY, size, offset);
    
    generateFakes();
  }
  
  void move() {
    
  }
  
  void drawAll() {
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
      
      for (ArrayList<Integer> fake : fakes) {
        pushMatrix();
        translate(gridXtoX(fake.get(0)), gridYtoY(fake.get(1)));
        if (offset == 0) { // If on left side
          rotate(-HALF_PI);
        } else { // If on right side
          rotate(HALF_PI);
        }
        image(imgs.get(imgCode), 0, 0, size, size);
        popMatrix();
      }
      
    }
  }
  
  void randomize() {
    this.gridX = (int)random(0,4);
    this.gridY = (int)random(0,4);
    updateLocation();
    generateFakes();
  }
  
  void generateFakes() {
    this.fakes = new HashSet<ArrayList<Integer>>();
    
    int count = 0;
    ArrayList<Integer> temp;
    while (count < 4) {
      temp = new ArrayList<Integer>();
      temp.add((int)random(0,4));
      temp.add((int)random(0,4));
      
      if (temp.get(0) != gridX && temp.get(1) != gridY && !fakes.contains(temp)) {
        fakes.add(temp);
        count++;
      }
    } 
  }
}
