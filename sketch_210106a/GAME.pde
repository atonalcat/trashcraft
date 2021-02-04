void game() {
  bulletTimer++;
  Timer++;
  snowTimer++;
  pTimer++;
  healthTimer++;
  if (snowTimer==1) {
    objects.add(new snow());
    snowTimer=0;
  }
  if (Timer==300) {
    objects.add (new enemy());
    Timer=0;
  }
  if(healthTimer==900){
   objects.add(new health());
   healthTimer=0;
  }
  
  world.beginDraw();
  world.textureMode(NORMAL);
  //lights();
  world.pointLight(255, 255, 255, eyex, eyey, eyez);
  world.background(0);
  world.camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);
  drawFloor(-2000, 2000, height+200, 100);

  move();
  drawMap();

  int i=0;
  while (i<objects.size()) {
    GameObject obj = objects.get(i);
    obj.act();
    obj.show();
    if (obj instanceof enemy) {
      if (dist(eyex, eyey, eyez, obj.loc.x, obj.loc.y, obj.loc.z) <= 100 + obj.size) {
        obj.objlives=0;
        lives--;
        score++;
      }
    }
    if (obj.objlives == 0) {
      objects.remove(i);
    } else {
      i++;
    }
  }
  if (lives==0) {
    mode=GAMEOVER;
  }
  if (score==10) {
    mode=WIN;
  }
  if (pkey && pTimer>=30) {
    mode=PAUSE; 
    pTimer=0;
  }
  if(hkey && pTimer>=30){
   mode=HELP;
   pTimer=0;
  }
  if (eyey>height+100) {
    crouch=true;
    eyey=height+100;
  }else{
   crouch=false; 
  }
  world.endDraw();
  image(world, 0, 0);
  HUD.beginDraw();
  HUD.clear();
  HUD.stroke(white);
  HUD.strokeWeight(5);
  drawCrosshair();
  drawMinimap();
  HUD.line(width/2-20, height/2, width/2+20, height/2); 
  HUD.line(width/2, height/2-20, width/2, height/2+20); 
  HUD.endDraw();
  image(HUD, 0, 0);
}
