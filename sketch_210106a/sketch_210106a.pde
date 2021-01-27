import java.awt.Robot;
color black = #000000;
color white = #FFFFFF;
color dullBlue = #7092BE;
float eyex, eyey, eyez; //camerapos
float focusx, focusy, focusz;
float upx, upy, upz;
boolean wkey, akey, skey, dkey, spacekey, shiftkey, rightclick;
float leftRightAngle, upDownAngle;
int gridSize;
PImage map;
PImage mossyStone;
PImage oakPlanks;
Robot rbt;
ArrayList<GameObject> objects;
void setup() {
  objects = new ArrayList<GameObject>(); 
  mossyStone = loadImage("Mossy_Stone_Bricks.png");
  oakPlanks = loadImage("Oak_Planks.png");
  textureMode(NORMAL);
  try {
    rbt = new Robot();
  }
  catch(Exception e) {
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

  map = loadImage("map.png");
  gridSize = 100;
  mouseX=width/2;
  mouseY=height/2;
}

void draw() {
  //lights();
  pointLight(255, 255, 255, eyex, eyey, eyez);
  background(0);
  camera(eyex, eyey, eyez, focusx, focusy, focusz, upx, upy, upz);
  drawFloor(-2000, 2000, height+200, 100);
  drawFloor(-2000, 2000, height-gridSize*5, 100);
  move();
  drawMap();
  
  int i=0;
  while(i<objects.size()){
   GameObject obj = objects.get(i);
   obj.act();
   obj.show();
   if(obj.lives == 0){
    objects.remove(1); 
   }else{
    i++; 
   }
  }
 
}

void Robot() {
}
