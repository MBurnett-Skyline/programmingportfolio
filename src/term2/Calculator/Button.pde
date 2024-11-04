class Button {
  // Member Variables
  int x, y, w, h, cur;
  color c1, c2;
  String val;
  boolean on, isNum, type;

  
  // Constructor
  Button(int x, int y, int w, int h, int cur, color c1, color c2, String val, boolean type, boolean isNum) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.cur = cur;
    this.c1 = c1;
    this.c2 = c2;
    this.val = val;
    this.type = type;
    this.isNum = isNum;
    on = false;
  }
  
  // Methods
  void display() {
    
    if (on) {
      fill(c2);
    } else {
      fill(c1);
    }
    
    if (type) {
      rect(x,y,w,h,cur);
    } else {
      ellipse(x,y,w,h);
    }
    
    rectMode(CENTER);
    ellipseMode(CENTER);
    fill(0);
    textAlign(CENTER,CENTER);
    textSize(15);
    text(val,x,y);
  }
  
  boolean hover(int mx, int my) {
    if (mx > x-w/2 && mx < x+w/2 && my > y-h/2 && my < y+h/2) {
      on = true;
      return on;
    } else {
      on = false;
      return on;
    }
  }
  
  
  
  
  
}
