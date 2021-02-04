class health extends GameObject {


  health() {   
    super(random(-1900, 1900), height+100, random(-1900, 1900), 100);
  }
  void act() {

    int i = 0;

    while (i < objects.size()) {
      GameObject fartObj = objects.get(i);
      if (fartObj instanceof health ) {
        if (dist(loc.x, loc.y, loc.z, eyex, eyey, eyez) <= 100 + fartObj.size) {
          objlives=0;
          lives=3;
        }
      }
      i++;
    }
  }

  void show() {
    potion.setTexture(pink);
    world.pushMatrix();
    world.translate(loc.x, loc.y+100, loc.z);
    world.rotateX(radians(180));
    world.scale(10,10,10);
    world.shape(potion);


    world.popMatrix();
  }
}
