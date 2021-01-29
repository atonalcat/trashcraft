void move() {
  pushMatrix();



  popMatrix();

  if (akey && canMoveLeft()) {
    eyex = eyex + cos(leftRightAngle+PI/2)*-10;
    eyez = eyez + sin(leftRightAngle+PI/2)*-10;
  }
  if (dkey && canMoveRight()) {
    eyex = eyex + cos(leftRightAngle+PI/2)*10;
    eyez = eyez + sin(leftRightAngle+PI/2)*10;
  }
  if (wkey && canMoveForward()) {
    eyex = eyex + cos(leftRightAngle)*10;
    eyez = eyez + sin(leftRightAngle)*10;
  }
  if (skey && canMoveBack()) {
    eyex = eyex + cos(leftRightAngle)*-10;
    eyez = eyez + sin(leftRightAngle)*-10;
  }
  if (spacekey) eyey = eyey - 7;
  if (shiftkey) eyey = eyey + 7;
  focusx = eyex + cos(leftRightAngle)*100;
  focusy = eyey + tan(upDownAngle)*100;
  focusz = eyez + sin(leftRightAngle)*100;

  if (mouseX > width-2) rbt.mouseMove(1, mouseY);
  if (mouseX < 2) rbt.mouseMove(width-1, mouseY);
  leftRightAngle = leftRightAngle + (mouseX - pmouseX)*0.01;
  upDownAngle = upDownAngle + (mouseY - pmouseY)*0.01;
  if (upDownAngle > PI/2.1) {
    upDownAngle = PI/2.1;
  }
  if (upDownAngle < -PI/2.1) {
    upDownAngle = -PI/2.1;
  }
  if (rightclick) objects.add(new Bullet());
  
  //world.pushMatrix();
  //world.translate(eyex + cos(leftRightAngle)*200, eyey, eyez + sin(leftRightAngle)*200);
  //world.fill(255);
  //world.sphere(20);
  //world.popMatrix();
}

boolean canMoveForward() {
  float fwdx, fwdy, fwdz;
  float leftx, lefty, leftz;
  float rightx, righty, rightz;
  int mapx, mapy;
  int leftmapx, leftmapy;
  int rightmapx, rightmapy;
  fwdx = eyex + cos(leftRightAngle)*200;
  leftx = eyex + cos(leftRightAngle-radians(1/2))*200;
  rightx = eyex + cos(leftRightAngle+radians(1/2))*200;
  fwdy = eyey;
  fwdz = eyez + sin(leftRightAngle)*200;
  leftz = eyex + cos(leftRightAngle-radians(1/2))*200;
  rightz = eyex + cos(leftRightAngle+radians(1/2))*200;

  

  mapx = int(fwdx+2000)/gridSize;
  mapy = int(fwdz+2000)/gridSize;
  
  leftmapx=int(leftx+2000)/gridSize;
  rightmapx=int(rightx+2000)/gridSize;
  leftmapy=int(leftz+2000)/gridSize;
  rightmapy=int(rightz+2000)/gridSize;
  println(mapx, mapy);
  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}
boolean canMoveLeft() {
  float fwdx, fwdy, fwdz;
  float leftx, lefty, leftz;
  float rightx, righty, rightz;
  int mapx, mapy;
  leftx = eyex + cos(leftRightAngle+PI/2)*-200;
  lefty = eyey;
  leftz = eyez + sin(leftRightAngle+PI/2)*-200;

  mapx=int(leftx+2000)/gridSize;
  mapy = int(leftz+2000)/gridSize;
  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}
boolean canMoveRight() {
  float fwdx, fwdy, fwdz;
  float leftx, lefty, leftz;
  float rightx, righty, rightz;
  int mapx, mapy;
  rightx = eyex + cos(leftRightAngle+PI/2)*200;
  righty = eyey;
  rightz = eyez + sin(leftRightAngle+PI/2)*200;

  mapx=int(rightx+2000)/gridSize;
  mapy = int(rightz+2000)/gridSize;
  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}
boolean canMoveBack() {
  float backx, backy, backz;
  int mapx, mapy;
  backx = eyex + cos(leftRightAngle)*-200;
  backy = eyey;
  backz = eyez + sin(leftRightAngle)*-200;

  mapx=int(backx+2000)/gridSize;
  mapy = int(backz+2000)/gridSize;
  if (map.get(mapx, mapy) == white) {
    return true;
  } else {
    return false;
  }
}
