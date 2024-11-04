class Button {
  // Member Variables
  float x, y, w, h;
  color c1, c2;
  String val;
  char type;
  boolean on, isNum;

  //Constructor
  Button (float x, float y, String val, float w, float h, char type, boolean isNum) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    c1 = color(255);
    c2 = color (200);
    this.val = val;
    this.type = type;
    on=false;
    this.isNum = isNum;
  }

  //Member Methods
  void display() {
    if (on) {
      fill(c2);
    } else {
      fill (c1);
    }
    if (type == 'd') {
      textSize (16);
      rectMode(CENTER);
      rect(x, y, w, h, 10);
    } else if (type == 'o') {
      textSize (10);
      ellipseMode (CENTER);
      ellipse (x, y, 20, 20);
    }
    fill(0);
    textAlign (CENTER, CENTER);
    text(val, x, y);
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
