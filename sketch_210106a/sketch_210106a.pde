import java.awt.Robot;
int Timer, bulletTimer, snowTimer, pTimer, healthTimer;
int mode=0;
int lives=3;
int score=0;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
final int WIN = 4;
final int HELP = 5;
color black = #000000;
color white = #FFFFFF;
color gold = #FFD700;
color dullBlue = #7092BE;
float eyex, eyey, eyez; //camerapos
float focusx, focusy, focusz;
float upx, upy, upz;
boolean wkey, akey, skey, dkey, pkey, hkey, spacekey, shiftkey, rightclick;
boolean crouch;
float leftRightAngle, upDownAngle;
int gridSize;
PImage map;
PImage mossyStone;
PImage oakPlanks;
PImage zombie;
PImage bullet;
PImage pink;
PShape potion;
PShape zombiepic;
Robot rbt;
ArrayList<GameObject> objects;
PGraphics world;
PGraphics HUD;

void setup() {
  rectMode(CENTER);
  textAlign(CENTER, CENTER);
  world = createGraphics(width, height, P3D);
  HUD = createGraphics(width, height, P2D);
  objects = new ArrayList<GameObject>(); 
  mossyStone = loadImage("bluewool.png");
  oakPlanks = loadImage("redwool.png");
  zombie = loadImage("pink.png");
  bullet = loadImage("bullet.jpg");
  pink = loadImage("T_bottle1_D.png");
  potion = loadShape("bottle1.obj");
  zombiepic = loadShape("Zombie.obj");
  try {
    rbt = new Robot();
  }
  catch(Exception e) {
    e.printStackTrace();
  }
  size(displayWidth, displayHeight, P2D);
  eyex = width/2;
  eyey = height+100;
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

  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameover();
  } else if (mode == WIN) {
    win();
  } else if(mode==HELP){
    help();
  }else{
    println("error mode" + mode);
  }
}

void Robot() {
}
