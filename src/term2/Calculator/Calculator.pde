//Katelyn Lin | Calculator | 2 October 2024
Button[] buttons = new Button [23];
String dVal = "0.0";
float l, r, res;
char op;
boolean left;

void setup () {
  size (210, 260);

  l = 0.0;
  r = 0.0;
  res = 0.0;
  op = ' ';
  left = true;

  //Numbers
  buttons[0] = new Button(60, 230, ".", 30, 30, 'd', false);
  buttons[1] = new Button(95, 230, "±", 30, 30, 'd', false);
  buttons[2] = new Button(25, 230, "0", 30, 30, 'd', true);
  buttons[3] = new Button(25, 195, "1", 30, 30, 'd', true);
  buttons[4] = new Button(60, 195, "2", 30, 30, 'd', true);
  buttons[5] = new Button(95, 195, "3", 30, 30, 'd', true);
  buttons[6] = new Button(25, 160, "4", 30, 30, 'd', true);
  buttons[7] = new Button(60, 160, "5", 30, 30, 'd', true);
  buttons[8] = new Button(95, 160, "6", 30, 30, 'd', true);
  buttons[9] = new Button(25, 125, "7", 30, 30, 'd', true);
  buttons[10] = new Button(60, 125, "8", 30, 30, 'd', true);
  buttons[11] = new Button(95, 125, "9", 30, 30, 'd', true);

  //Core
  buttons[12] = new Button(40, 85, "Clear", 60, 30, 'd', false);
  buttons[13] = new Button(110, 85, "Delete", 60, 30, 'd', false);
  buttons[14] = new Button(160, 235, "=", 80, 30, 'd', false);

  //Symbols
  buttons[15] = new Button(137.5, 125, "+", 35, 30, 'd', false);
  buttons[16] = new Button(182.5, 125, "-", 35, 30, 'd', false);
  buttons[17] = new Button(137.5, 167, "×", 35, 30, 'd', false);
  buttons[18] = new Button(182.5, 167, "÷", 35, 30, 'd', false);

  //Miscellaneous
  buttons[19] = new Button(137.5, 200, "xⁿ", 35, 20, 'd', false);
  buttons[20] = new Button(182.5, 200, "√x", 35, 20, 'd', false);
  buttons[21] = new Button(160, 85, "x²", 10, 10, 'o', false);
  buttons[22] = new Button(190, 85, "π", 10, 10, 'o', false);
}

void draw () {
  //println ("Left:" + l + " Right:" + r + " Result:" + res + " op:" + op + "L:" + left);
  background (0);
  for (int i=0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }

  //Title
  fill(255);
  textAlign(CENTER, CENTER);
  textSize (18);
  text ("Calculator", width/2, 60);

  updateDisplay();
}

void updateDisplay() {
  rectMode(CENTER);
  stroke (0);
  fill (160);
  rect (width/2, 30, 190, 40, 10);
  fill (0);
  if (dVal.length()<12) {
    textSize(30);
  } else if (dVal.length() == 12) {
    textSize(28);
  } else if (dVal.length() == 13) {
    textSize(26);
  } else if (dVal.length() == 14) {
    textSize(24);
  } else if (dVal.length() == 15) {
    textSize(22);
  } else if (dVal.length() == 16) {
    textSize(20);
  } else if (dVal.length() == 17) {
    textSize(18);
  } else if (dVal.length() == 18) {
    textSize(16);
  }
  textAlign (RIGHT);
  text (dVal, width-15, 45);
}


void mousePressed() {
  for (int i=0; i<buttons.length; i++) {
    if (buttons[i].on && buttons[i].isNum && left == true && dVal.equals("0.0")) {
      dVal = buttons[i].val;
      l = float(dVal);
    } else if (buttons[i].on && buttons[i].isNum && left == true && dVal.length()<18) {
      dVal += buttons[i].val;
      l = float(dVal);
    } else if (buttons[i].on && buttons[i].isNum && !left) {
      dVal += buttons[i].val;
      r = float(dVal);
    } else if (buttons[i].on && buttons[i].val.equals("Clear")) {
      handleEvent("Clear", false);
    } else if (buttons [i].on && buttons [i].val.equals("Delete")) {
      handleEvent("Delete", false);
    } else if (buttons[i].on && buttons[i].val.equals("+")) {
      handleEvent("+", false);
    } else if (buttons[i].on && buttons[i].val.equals("-")) {
      handleEvent("-", false);
    } else if (buttons[i].on && buttons[i].val.equals("×")) {
      handleEvent("*", false);
    } else if (buttons[i].on && buttons[i].val.equals("÷")) {
      handleEvent("/", false);
    } else if (buttons[i].on && buttons[i].val.equals("xⁿ")) {
      dVal += buttons[i].val;
      op = 's';
      left = false;
      dVal = " ";
    } else if (buttons[i].on && buttons [i].val.equals("=")) {
      handleEvent("=", false);
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("±")) {
      if (left) {
        l*=-1;
        dVal = str(l);
      } else if (!left) {
        r*=-1;
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("√x")) {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else if (!left) {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("x²")) {
      if (left) {
        l = sq(l);
        dVal = str(l);
      } else if (!left) {
        r = sq(r);
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals(".")) {
      handleEvent(".", false);
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("π")) {
      if (left) {
        l = PI;
        dVal = str(l);
      } else if (!left) {
        r = PI;
        dVal = str(r);
      }
    }
  }
}


void keyPressed () {
  println("Key:" + key);
  println("KeyCode:" + keyCode);

  //Keyboard Num
  if (key == 0  || keyCode == 96 || keyCode == 48) {
    handleEvent("0", true);
  } else if (key == 1 || keyCode == 97 || keyCode == 49) {
    handleEvent("1", true);
  } else if (key == 2 || keyCode == 98 || keyCode == 50) {
    handleEvent("2", true);
  } else if (key == 3 || keyCode == 99 || keyCode == 51) {
    handleEvent("3", true);
  } else if (key == 4 || keyCode == 100 || keyCode == 52) {
    handleEvent("4", true);
  } else if (key == 5 || keyCode == 101 || keyCode == 53) {
    handleEvent("5", true);
  } else if (key == 6 || keyCode == 102 || keyCode == 54) {
    handleEvent("6", true);
  } else if (key == 7 || keyCode == 103 || keyCode == 55) {
    handleEvent("7", true);
  } else if (key == 8 || keyCode == 104 || keyCode == 56) {
    handleEvent("8", true);
  } else if (key == 9 || keyCode == 105 || keyCode == 57) {
    handleEvent("9", true);
  } else if (key == '.' || keyCode == 97 || keyCode == 48) {
    handleEvent(".", true);

    //Keyboard Sym
  } else if (key == '+' || keyCode == 107) {
    handleEvent("+", false);
  } else if (key == '-' || keyCode == 109) {
    handleEvent("-", false);
  } else if (key == '*' || keyCode == 106) {
    handleEvent("*", false);
  } else if (key == '/' || keyCode == 111) {
    handleEvent("/", false);

    //Keyboard Core
  } else if (keyCode == 10) {
    handleEvent("=", false);
  } else if (keyCode == 32 || keyCode == 12) {
    handleEvent("Clear", false);
  } else if (keyCode == 8 || keyCode == 127) {
    handleEvent("Delete", false);
  }
}

void handleEvent(String keyVal, boolean isNum) {
  if (isNum && left == true && dVal.equals("0.0")) {
    dVal = keyVal;
    l = float(dVal);
  } else if (left && dVal.length()<18 && isNum) {
    dVal+=keyVal;
    l = float(dVal);
  } else if (!left && dVal.length() <18 && isNum) {
    dVal += keyVal;
    r = float(dVal);
  } else if (keyVal.equals("+") && !isNum) {
    op = '+';
    left = false;
    dVal = " ";
  } else if (keyVal.equals("-") && !isNum) {
    op = '-';
    left = false;
    dVal = " ";
  } else if (keyVal.equals("*") && !isNum) {
    op = '*';
    left = false;
    dVal = " ";
  } else if (keyVal.equals("/") && !isNum) {
    op = '/';
    left = false;
    dVal = " ";
  } else if (keyVal.equals("=") && !isNum) {
    performCalc();
  } else if (keyVal.equals("Clear") && !isNum) {
    dVal = "0.0";
    l = 0.0;
    r = 0.0;
    res = 0.0;
    op = ' ';
    left = true;
  } else if (keyVal.equals(".") && !isNum) {
    if (!dVal.contains(".")) {
      dVal += keyVal;
    }
  } else if (keyVal.equals("Delete") && !isNum && dVal.length()>0) {
    if (left) {
      dVal = dVal.substring(0, dVal.length () -1);
      l = float(dVal);
    } else if (!left) {
      dVal = dVal.substring(0, dVal.length () -1);
      r = float(dVal);
    }
  }
}

void performCalc() {
  if (op == '+') {
    res = l + r;
  } else if (op == '-') {
    res = l - r;
  } else if (op == '*') {
    res = l * r;
  } else if (op == '/') {
    res = l / r;
  } else if (op == 's') {
    res = pow(l, r);
  }
  dVal = str(res);
}
