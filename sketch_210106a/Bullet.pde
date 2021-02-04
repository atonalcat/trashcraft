class Bullet extends GameObject {
  PVector dir;
  float size;
  float speed;

  Bullet() {
    super(eyex, eyey, eyez, 10);
    speed = 50;
    float vx = cos(leftRightAngle);
    float vy = tan(upDownAngle);
    float vz = sin(leftRightAngle);
    dir = new PVector(vx, vy, vz);
    dir.setMag(speed);
  }
  void act() {
    int hitx = int(loc.x+2000)/gridSize;
    int hity = int(loc.z+2000)/gridSize;
    if (map.get(hitx, hity)==white) {
      loc.add(dir);
    } else {
      objlives=0;
      for (int i =0; i<5; i++) {
        objects.add(new Particle(loc));
      }
    }
    
  }
  void show(){
   texturedCube(loc.x, loc.y, loc.z, bullet, 25);
   
  }
}
