void move() {

  pushMatrix();



  popMatrix();

  if (akey && canMoveLeft()) {
    if (crouch==false) {
      eyex = eyex + cos(leftRightAngle+PI/2)*-10;
      eyez = eyez + sin(leftRightAngle+PI/2)*-10;
    }
    if (crouch) {
      eyex = eyex + cos(leftRightAngle+PI/2)*-5;
      eyez = eyez + sin(leftRightAngle+PI/2)*-5;
    }
  }
  if (dkey && canMoveRight()) {
    if (crouch==false) {
      eyex = eyex + cos(leftRightAngle+PI/2)*10;
      eyez = eyez + sin(leftRightAngle+PI/2)*10;
    }
    if (crouch) {
      eyex = eyex + cos(leftRightAngle+PI/2)*5;
      eyez = eyez + sin(leftRightAngle+PI/2)*5;
    }
  }
  if (wkey && canMoveForward()) {
    if (crouch==false) {
      eyex = eyex + cos(leftRightAngle)*10;
      eyez = eyez + sin(leftRightAngle)*10;
    }

    if (crouch) {
      eyex = eyex + cos(leftRightAngle)*5;
      eyez = eyez + sin(leftRightAngle)*5;
    }
  }

if (skey && canMoveBack()) {
  if (crouch==false) {
    eyex = eyex + cos(leftRightAngle)*-10;
    eyez = eyez + sin(leftRightAngle)*-10;
  }
  if (crouch) {
    eyex = eyex + cos(leftRightAngle)*-5;
    eyez = eyez + sin(leftRightAngle)*-5;
  }
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
if(crouch==false){
if (rightclick && bulletTimer>=20) {
  objects.add(new Bullet());
  bulletTimer=0;
}
}else{
  if (rightclick && bulletTimer>=10) {
  objects.add(new Bullet());
  bulletTimer=0;
}
}

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







  for (int i = -45; i<=45; i++) {
    fwdx = eyex + cos(leftRightAngle+radians(i))*100;
    fwdy = eyey;
    fwdz = eyez + sin(leftRightAngle+radians(i))*100;
    mapx = int(fwdx+2000)/gridSize;
    mapy = int(fwdz+2000)/gridSize;
    if (map.get(mapx, mapy) != white) {
      return false;
    }
  }
  return true;
}
boolean canMoveLeft() {
  float fwdx, fwdy, fwdz;
  float leftx, lefty, leftz;
  float rightx, righty, rightz;
  int mapx, mapy;
  for (int i = -45; i<=45; i++) {
    fwdx = eyex + cos(leftRightAngle+radians(i)-PI/2)*100;
    fwdy = eyey;
    fwdz = eyez + sin(leftRightAngle+radians(i)-PI/2)*100;
    mapx = int(fwdx+2000)/gridSize;
    mapy = int(fwdz+2000)/gridSize;
    if (map.get(mapx, mapy) != white) {
      return false;
    }
  }
  return true;
}
boolean canMoveRight() {
  float fwdx, fwdy, fwdz;
  float leftx, lefty, leftz;
  float rightx, righty, rightz;
  int mapx, mapy;
  for (int i = -45; i<=45; i++) {
    fwdx = eyex - cos(leftRightAngle+radians(i)-PI/2)*100;
    fwdy = eyey;
    fwdz = eyez - sin(leftRightAngle+radians(i)-PI/2)*100;
    mapx = int(fwdx+2000)/gridSize;
    mapy = int(fwdz+2000)/gridSize;
    if (map.get(mapx, mapy) != white) {
      return false;
    }
  }
  return true;
}
boolean canMoveBack() {
  float fwdx, fwdy, fwdz;
  int mapx, mapy;
  for (int i = -45; i<=45; i++) {
    fwdx = eyex - cos(leftRightAngle+radians(i))*100;
    fwdy = eyey;
    fwdz = eyez - sin(leftRightAngle+radians(i))*100;
    mapx = int(fwdx+2000)/gridSize;
    mapy = int(fwdz+2000)/gridSize;
    if (map.get(mapx, mapy) != white) {
      return false;
    }
  }
  return true;
}
