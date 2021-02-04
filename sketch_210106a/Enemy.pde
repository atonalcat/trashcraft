class enemy extends GameObject {
  PVector dir;
  float speed;

  enemy() {   
    super(random(-2000, 2000), height+100, random(-2000, 2000), 100);
    speed=10;
  }
  void act() {
    float vx = eyex-loc.x;
    float vy = 0;
    float vz = eyez-loc.z;
    dir = new PVector(vx, vy, vz);
    dir.setMag(speed);
    loc.add(dir);
    int i = 0;

    while (i < objects.size()) {
      GameObject fartObj = objects.get(i);
      if (fartObj instanceof Bullet ) {
        if (dist(loc.x, loc.y, loc.z, fartObj.loc.x, fartObj.loc.y, fartObj.loc.z) <= 100 + fartObj.size) {
          objlives=0;
          score++;
          
        }
      }
      i++;
    }
  }

  void show() {
    zombiepic.setTexture(zombie);
    world.pushMatrix();
    world.translate(loc.x, loc.y+100, loc.z);
    world.rotateX(radians(180));
    world.scale(5, 5, 5);
    world.shape(zombiepic);


    world.popMatrix();
  }
}
