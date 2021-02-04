void button(int x, int y, int w, int h, int size, String text) {
  if (touchingMouse(x, y, w, h)) {


    stroke(0, 0, 255);
    strokeWeight(5);
  } else {
    stroke(0);
    strokeWeight(1);
  }
  textSize(size/2+10);
 
  fill(255);
  rect(x, y, w, h);
  fill(0);
  text(text, x, y);
}
boolean touchingMouse(int x, int y, int w, int h) {
  if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
    return true;
  }
  return false;
}
