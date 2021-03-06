void drawCrosshair() {
  HUD.stroke(white);
  HUD.strokeWeight(5);
  HUD.line(width/2-20, height/2, width/2+20, height/2); 
  HUD.line(width/2, height/2-20, width/2, height/2+20);
}

void drawMinimap() {
  HUD.image(map, 50, 50, 160, 160);
  int miniX = int(eyex+2000)/gridSize;
  int miniY = int(eyez+2000)/gridSize;
  HUD.textSize(20);
  HUD.fill(white);
  HUD.text("X: " + miniX, 50, 230);
  HUD.text("Y: " + miniY, 50, 260);
  HUD.text("Score(10 to win): " + score, 50, 350);
  HUD.strokeWeight(1);
  HUD.stroke(255, 0, 0);
  HUD.fill(255, 0, 0);
  HUD.rect(miniX*4+50, miniY*4+50, 4, 4);
  HUD.text("Lives: " + lives, 50, 300);
  HUD.text("Press P to pause", 50, 400);
  HUD.fill(0,100,200);
  HUD.text("Press H for help", 50, 450);
}
