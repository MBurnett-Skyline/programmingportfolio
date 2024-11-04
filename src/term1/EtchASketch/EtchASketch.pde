//Matilda Burnett | Etch-A-Sketch | 18 Sept. 2024
int x, y;
PImage e1;

void setup() {
  size(800, 658);
  background(128);
  x = width/2;
  y = height/2;
  e1 = loadImage("Etch.png");
}

void draw() {
  image(e1, 0, 0);
  strokeWeight(3);
  point(x,y);


  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      y --;
    } else if (key == 's' || key == 'S') {
      y ++;
    } else if (key == 'd' || key == 'D') {
      x ++;
    } else if (key == 'a' || key == 'A') {
      x --;
    }
  }
}

 void keyPressed() {
    if (key == CODED) {
      if (keyCode == UP) {
        y --;
      } else if (keyCode == DOWN) {
        y ++;
      } else if (keyCode == RIGHT) {
        x ++;
      } else if (keyCode == LEFT) {
        x --;
      }
    }
  }

  void mousePressed() {
    saveFrame("line-######.png");
  }
