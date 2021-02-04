void help() {
  pTimer++;
  background(0, 0, 255);
  fill(0);
  textSize(30);
  text("Right click to shoot.", 200, 100);
  text("Space to move up and if in the air, shift to go down.", 450, 150);
  text("Potions spawn every 15 seconds, they will set you back at full health(3).", 600, 200);
  text("If on ground, pressing shift will make you crouch and allows you to shoot at 2x speed while moving at only half speed.", 950, 250);
  text("WASD to move around.", 250, 300);
  text("To make game more fun, don't use space bar to cheat. :)", 500, 350);
  text("Have fun!", 200, 400);
  text("(I wasn't able to find the proper texture for the zombie so I guess we're fighting pinkish gray zombies)", 800, 450);
  text("PAUSED, press H to go back.", width/2, height/2);
  if (hkey && pTimer>30) {
    mode=GAME; 
    pTimer=0;
  }
}
