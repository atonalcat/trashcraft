class Particle extends GameObject {
  PVector vel;
  PVector gravity;
  float speed;
  Particle(PVector newloc) {
    super();
    objlives = 255;
    loc = newloc.copy();
    speed = 50;
    float vx = random(-5, 5);
    float vy = random(-5, 5);
    float vz = random(-5, 5);
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
   world.pushMatrix();
   world.translate(loc.x, loc.y, loc.z);
   world.fill(gold, objlives);
   world.stroke(100);
   world.box(size);
   world.popMatrix();
   objlives--;
  }
}
