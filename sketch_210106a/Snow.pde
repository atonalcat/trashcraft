class snow extends GameObject {
  PVector dir;
  float speed;
  
  snow() {   
    super(random(-2000, 2000), 0, random(-2000, 2000), 5);
    speed=10;
    objlives=500;
  }
  void act() {
    float vx = 0;
    float vy = 10;
    float vz = 0;
    dir = new PVector(vx, vy, vz);
    dir.setMag(speed);
    loc.add(dir);
    if (loc.y >= height+200) {
      loc.y = height+200;
    }
  }
  void show() {
    world.pushMatrix();
    world.translate(loc.x, loc.y, loc.z);
    world.fill(white, objlives);
    world.stroke(100);
    world.box(size);
    world.popMatrix();
    objlives--;
  }
}
