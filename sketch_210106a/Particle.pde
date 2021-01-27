class Particle extends GameObject {
  PVector vel;
  PVector gravity;
  float speed;
  Particle(PVector newloc) {
    super();
    lives = 255;
    loc = newloc.copy();
    speed = 50;
    float vx = random(0, 3.14);
    float vy = random(0, 3.14);
    float vz = random(0, 3.14);
    vel = new PVector(vx, vy, vz);
    vel.setMag(speed);
    gravity = new PVector(0, 5, 0);
  }

  void act() {
    if (loc.y >= height+200) {
      loc.y = height+200;
    } else if (loc.y <= height-gridSize*3) {
      loc.y = height-gridSize*3;
    } else {
      vel.add(gravity);
      loc.add(vel);
    }
  }
  
  void show(){
   pushMatrix();
   translate(loc.x, loc.y, loc.z);
   fill(white, lives);
   stroke(100);
   box(size);
   popMatrix();
  }
}
