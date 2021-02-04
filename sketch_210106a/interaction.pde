void keyPressed() {
  if (key == 'w' || key == 'W') wkey = true;
  if (key == 'a' || key == 'A') akey = true;
  if (key == 's' || key == 'S') skey = true;
  if (key == 'd' || key == 'D') dkey = true;
  if(key == 'p' || key == 'P') pkey = true;
  if(key == 'h' || key == 'H') hkey = true;
  if (key == ' ' ) spacekey = true;
  if (key == CODED) {
    if (keyCode == SHIFT) {
      shiftkey = true;
    }
  }
}
void mousePressed() {
  if (mouseButton == RIGHT) {
    rightclick = true;
  }
}
void mouseReleased() {
  if (mouseButton == RIGHT) {
    rightclick=false;
  }
  if (mode == INTRO && touchingMouse(width/2, height/2, 200, 100)) {

    mode = GAME;
  }
  if(mode == GAMEOVER){
    mode=INTRO;
  }
  if(mode==WIN){
   mode=INTRO; 
  }
}

void keyReleased() {
  if (key == 'w' || key == 'W') wkey = false;
  if (key == 'a' || key == 'A') akey = false;
  if (key == 's' || key == 'S') skey = false;
  if (key == 'd' || key == 'D') dkey = false;
  if(key == 'p' || key == 'P') pkey = false;
  if(key == 'h' || key == 'H') hkey = false;
  if (key == ' ' ) spacekey = false;
  if (key == CODED) {
    if (keyCode == SHIFT) {
      shiftkey = false;
    }
  }
}
