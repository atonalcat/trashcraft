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
PGraphics world;
PGraphics HUD;
void setup() {
  world = createGraphics(width, height, P3D);
  HUD = createGraphics(width, height, P2D);
  objects = new ArrayList<GameObject>(); 
  mossyStone = loadImage("Mossy_Stone_Bricks.png");
  oakPlanks = loadImage("Oak_Planks.png");

  try {
    rbt = new Robot();
  }
  catch(Exception e) {
    e.printStackTrace();
  }
  size(displayWidth, displayHeight, P2D);
  eyex = width/2;
  eyey = height/2;
  eyez = height/2;

  focusx = width/2;
  focusy = height/2;
  focusz = height/2-100;

  upx = 0;
  upy = 1;
  upz = 0;

  map = loadImage("map.png");
  gridSize = 100;
  mouseX=width/2;
  mouseY=height/2;
}

void draw() {
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
    if (obj.lives == 0) {
      objects.remove(i);
    } else {
      i++;
    }
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

void Robot() {
}
