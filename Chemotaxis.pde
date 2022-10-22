boolean word = false;
Bacteria [] colony;

void setup()
{
  frameRate(1000);
  size(1000, 1000);
  background(200, 200, 200);
  colony = new Bacteria[100];
  for (int i=0; i<colony.length; i++) {
    colony[i] = new Bacteria();
  }
}

void mousePressed() {
  if (word == false) {
    word = true;
  } else if (word == true) {
    word = false;
  }
}

void draw()
{
  int wordX = 290;
  int wordY = 500;
  if (word == false) {
    background(0);
  } else if (word == true) {
    fill(0, 0, 0, 10);
    noStroke();
    rect(0, 0, 1000, 1000);
    fill(255, 50, 50);
    textSize(75);
    wordX += (int)(Math.random()*10) - 1;
    wordY += (int)(Math.random()*10) - 1;
    text("i wolf u <333", wordX, wordY);
  }
  for (int i = 0; i < colony.length; i++) {
    colony[i].move();
    colony[i].show();
  }
}
class Bacteria
{
  int x=0;
  int y=0;
  int myX=50;
  int myY=0;
  int Color = color((int)(Math.random()*256)+100, 0, 0);
  void show() {
    stroke(Color);
    fill(Color);
    smooth();
    noStroke();
    beginShape();
    vertex(x+50, y+15);
    bezierVertex(x+50, -5+y, 90+x, 5+y, 50+x, 40+y);
    vertex(x+50, y+15);
    bezierVertex(50+x, -5+y, 10+x, 5+y, 50+x, 40+y);
    endShape();
  }
  void move() {
    if (mouseY>myY) {
      y++;
      myY ++;
    } else if (mouseY<myY) {
      y--;
      myY --;
    }
    if (mouseX>myX) {
      x ++;
      myX ++;
    } else if (mouseX<myX) {
      x --;
      myX --;
    }
    x = x+ (int)(Math.random()*3) - 1;
    y = y+ (int)(Math.random()*3) - 1;
  }
}
