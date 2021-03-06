import java.awt.Robot;

float eyex, eyey, eyez; //camerapos
float focusx, focusy, focusz;
float upx, upy, upz;
boolean wkey, akey, skey, dkey, spacekey, shiftkey;
float leftRightAngle, upDownAngle;
Robot rbt;
void setup() {
  try{
   rbt = new Robot(); 
  }
  catch(Exception e){
   e.printStackTrace(); 
  }
  size(displayWidth, displayHeight, P3D);
  eyex = width/2;
  eyey = height/2;
  eyez = height/2;

  focusx = width/2;
  focusy = height/2;
  focusz = height/2 - 100;

  upx = 0;
  upy = 1;
  upz = 0;
}

void draw() {
  background(0);
  camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);
  drawFloor(-2000, 2000, height, 100);
  move();
}
void move() {
  pushMatrix();



  popMatrix();
  if (akey){
    eyex = eyex + cos(leftRightAngle+PI/2)*-10;
    eyez = eyez + sin(leftRightAngle+PI/2)*-10; 
  }
  if (dkey){
    eyex = eyex + cos(leftRightAngle+PI/2)*10;
    eyez = eyez + sin(leftRightAngle+PI/2)*10; 
  }
  if (wkey){
    eyex = eyex + cos(leftRightAngle)*10;
    eyez = eyez + sin(leftRightAngle)*10;
  }
  if (skey){
    eyex = eyex + cos(leftRightAngle)*-10;
    eyez = eyez + sin(leftRightAngle)*-10; 
  }
  if (spacekey) eyey = eyey - 7;
  if (shiftkey) eyey = eyey + 7;
  focusx = eyex + cos(leftRightAngle)*100;
  focusy = eyey + tan(upDownAngle)*100;
  focusz = eyez + sin(leftRightAngle)*100;

if(mouseX > width-2) rbt.mouseMove(1, mouseY);
if(mouseX < 2) rbt.mouseMove(width-1, mouseY);
  leftRightAngle = leftRightAngle + (mouseX - pmouseX)*0.01;
  upDownAngle = upDownAngle + (mouseY - pmouseY)*0.01;
  if(upDownAngle > PI/2.1){
   upDownAngle = PI/2.1; 
  }
  if(upDownAngle < -PI/2.1){
   upDownAngle = -PI/2.1; 
  }
}
void Robot(){
  }
void drawAxis() {
}
void drawFloor(int start, int end, int level, int gap) {
  //line(x1,y1,z1,  x2,y2,z2);
  stroke(255);
  strokeWeight(3);
  int x = start;
  int z = start;
  while (x<end) {
    line(x, level, start, x, level, end);
    line(start, height, z, end, height, z);
    x=x+gap;
    z=z+gap;
  }
}

void keyPressed() {
  if (key == 'w' || key == 'W') wkey = true;
  if (key == 'a' || key == 'A') akey = true;
  if (key == 's' || key == 'S') skey = true;
  if (key == 'd' || key == 'D') dkey = true;
  if (key == ' ' ) spacekey = true;
  if (key == CODED) {
    if (keyCode == SHIFT) {
      shiftkey = true;
    }
  }
}


void keyReleased() {
  if (key == 'w' || key == 'W') wkey = false;
  if (key == 'a' || key == 'A') akey = false;
  if (key == 's' || key == 'S') skey = false;
  if (key == 'd' || key == 'D') dkey = false;
  if (key == ' ' ) spacekey = false;
  if (key == CODED) {
    if (keyCode == SHIFT) {
      shiftkey = false;
    }
  }
}
