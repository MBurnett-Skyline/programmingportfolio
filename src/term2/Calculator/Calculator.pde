// Matilda Burnett | Calculator App | 30 Sept. 2024

Button[] buttons = new Button[23];
String dVal = "0";
float l, r, res;
char op;
boolean left;

void setup() {
  size(560, 340);
  background(50);

  l = 0.0;
  r = 0.0;
  res = 0.0;
  op = ' ';
  left = true;
  // Colorful/Basic Function Buttons
  textSize(18);
  buttons[0] = new Button(460, 60, 30, 30, 15, color(#C62825), color (#CADB3D), "÷", false, false);
  buttons[1] = new Button(490, 90, 30, 30, 15, color(#CADB3D), color(#CADB3D), "-", false, false);
  buttons[2] = new Button(430, 90, 30, 30, 15, color(#FDC210), color(#CADB3D), "+", false, false);
  buttons[3] = new Button(460, 120, 30, 30, 15, color(#18589F), color(#CADB3D), "*", false, false);

  // Power Up and Off/Equal Button
  buttons[4] = new Button(width/2, 80, 50, 50, 25, color(#CADB3D), color(#CADB3D), "=", false, false);

  // Small Buttons
  buttons[5] = new Button(width/2+50, 80, 25, 13, 7, color(#EAECEB), color(#CADB3D), "±", true, false);
  buttons[6] = new Button(width/2-50, 80, 25, 13, 7, color(#EAECEB), color(#CADB3D), ".", true, false);

  //Up,Down,Left,Right/Specific Function Buttons
  buttons[7] = new Button(150, 200, 30, 30, 5, color(#B3B3B3), color(#CADB3D), "√", true, false);
  buttons[8] = new Button(180, 230, 30, 30, 5, color(#B3B3B3), color(#CADB3D), "x²", true, false);
  buttons[9] = new Button(150, 260, 30, 30, 5, color(#B3B3B3), color(#CADB3D), "^", true, false);

  //Bumpers/Other Specific Functions
  buttons[10] = new Button(460, 25, 70, 25, 5, color(#B3B3B3), color(#CADB3D), "C", true, false);
  buttons[11] = new Button(100, 25, 70, 25, 5, color(#B3B3B3), color(#CADB3D), "%", true, false);

  //Numbers
  buttons[12] = new Button(50, 320, 50, 25, 5, color(#B3B3B3), color(#CADB3D), "0", true, true);
  buttons[13] = new Button(100, 320, 50, 25, 5, color(#B3B3B3), color(#CADB3D), "1", true, true);
  buttons[14] = new Button(150, 320, 50, 25, 5, color(#B3B3B3), color(#CADB3D), "2", true, true);
  buttons[15] = new Button(200, 320, 50, 25, 5, color(#B3B3B3), color(#CADB3D), "3", true, true);
  buttons[16] = new Button(250, 320, 50, 25, 5, color(#B3B3B3), color(#CADB3D), "4", true, true);
  buttons[17] = new Button(300, 320, 50, 25, 5, color(#B3B3B3), color(#CADB3D), "5", true, true);
  buttons[18] = new Button(350, 320, 50, 25, 5, color(#B3B3B3), color(#CADB3D), "6", true, true);
  buttons[19] = new Button(400, 320, 50, 25, 5, color(#B3B3B3), color(#CADB3D), "7", true, true);
  buttons[20] = new Button(450, 320, 50, 25, 5, color(#B3B3B3), color(#CADB3D), "8", true, true);
  buttons[21] = new Button(500, 320, 50, 25, 5, color(#B3B3B3), color(#CADB3D), "9", true, true);
  buttons[22] = new Button(120, 230, 30, 30, 5, color(#B3B3B3), color(#CADB3D), "?", true, false);
}

void draw() {

  background(123);
  for (int i = 0; i<buttons.length; i++) {
    buttons[i].display();
    buttons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
  // println("Left: " + l + " Right: " + r + " Result: " + res + " Operation: " + op + " L: " + left);
}

void updateDisplay() {
  rectMode(CENTER);
  fill(200);
  rect(width/2, 25, 190, 30, 5);
  fill(0);
  if (dVal.length()<16) {
    textSize(20);
  } else if (dVal.length() == 16) {
    textSize(19);
  } else if (dVal.length() == 17) {
    textSize(18);
  } else if (dVal.length() == 18) {
    textSize(17);
  }
  textAlign(RIGHT);
  text(dVal, width-220, 30);
}

void mousePressed() {
  for (int i = 0; i<buttons.length; i++) {
    if (buttons[i].on && buttons[i].isNum && left && dVal.length()<20) {
      dVal += buttons[i].val;
      l = float(dVal);
    } else if (buttons[i].on && buttons[i].isNum && !left) {
      dVal += buttons[i].val;
      r = float(dVal);
    } else if (buttons[i].on && buttons[i].val.equals("C")) {
      handleEvent("C", false);
    } else if (buttons[i].on && buttons[i].val.equals("+")) {
      handleEvent("+", false);
    } else if (buttons[i].on && buttons[i].val.equals("-")) {
      handleEvent("-", false);
    } else if (buttons[i].on && buttons[i].val.equals("÷")) {
      handleEvent("/", false);
    } else if (buttons[i].on && buttons[i].val.equals("*")) {
      handleEvent("*", false);
    } else if (buttons[i].on && buttons[i].val.equals("^")) {
      op = 'e';
      left = false;
      dVal = "0";
    } else if (buttons[i].on && buttons[i].val.equals("?")) {
      double rng = Math.random() * 5;
      println(rng);
      if (rng < 0.5) {
        dVal = ("Good number! :D");
      } else if (rng < 1.0) {
        dVal = ("Okay number... :|");
      } else if (rng < 1.5) {
        dVal = ("Bad number. :[");
      } else {
        dVal = ("TERRIBLE NUMBER! >:[");
      }
    } else if (buttons[i].on && buttons[i].val.equals("=")) {
      performCalc();
    } else if (buttons[i].on && buttons[i].val.equals("±")) {
      if (left) {
        l *= -1;
        dVal = str(l);
      } else if (!left) {
        r *= -1;
        dVal = str(r);
      }
    } else if (buttons[i].on && buttons[i].val.equals("√")) {
      if (left) {
        l = sqrt(l);
        dVal = str(l);
      } else if (!left) {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (buttons[i].on && buttons[i].val.equals("x²")) {
      if (left) {
        l = pow(l, 2);
        dVal = str(l);
      } else if (!left) {
        r = pow(r, 2);
        dVal = str(r);
      }
    } else if (buttons[i].on && !buttons[i].isNum && buttons[i].val.equals("%")) {
      if (left) {
        l = l/100;
        dVal = str(l);
      } else if (!left) {
        r = r/100;
        dVal = str(r);
      }
    } else if (buttons[i].on && buttons[i].val.equals(".")) {
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

    //if (buttons[i].on && dVal.equals("0.0")) {
    //  dVal = buttons[i].val;
    //} else if (buttons[i].on) {
    //  dVal += buttons[i].val;
    //}
    //  else if (buttons[i].on && buttons[i].val.equals(".")) {
    //if (!dVal.contains(".")) {
    //  dVal += buttons[i].val;
  }
}





void performCalc() {

  if (op == '+') {
    res = l + r;
  } else if (op =='-') {
    res = l - r;
  } else if (op =='*') {
    res = l * r;
  } else if (op =='/') {
    res = l / r;
  } else if (op == 'e') {
    res = pow(l, r);
  }
  dVal = str(res);
}


void keyPressed() {
  println("Key: " + key);
  println("KeyCode: " + keyCode);

  if (key == 0 || keyCode == 96 || keyCode == 48) {
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
  } else if (key == '.' || keyCode == 110 || keyCode == 46) {
    handleEvent(".", false);
  } else if (key == '-' || keyCode == 109 || keyCode == 45) {
    handleEvent("-", false);
  } else if (key == '/' || keyCode == 111 || keyCode == 47) {
    handleEvent("/", false);
  } else if (key == '*'|| keyCode == 106 || keyCode == 56) {
    handleEvent("*", false);
  } else if (key == '+' || keyCode == 107 || keyCode == 107) {
    handleEvent("+", false);
  } else if (key == '=' || keyCode == 10) {
    handleEvent("=", false);
  }
}

void handleEvent(String keyVal, boolean isNum) {
  if (left && dVal.length()<20 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    l = float(dVal);
  } else if (!left && dVal.length()<20 && isNum) {
    if (dVal.equals("0")) {
      dVal = keyVal;
    } else {
      dVal += keyVal;
    }
    r =float(dVal);
  } else if (keyVal.equals("+") && !isNum) {
    op = '+';
    left = false;
    dVal = "0";
  } else if (keyVal.equals("-") && !isNum) {
    op = '-';
    left = false;
    dVal = "0";
  } else if (keyVal.equals("/") && !isNum) {
    op = '/';
    left = false;
    dVal = "0";
  } else if (keyVal.equals("*") && !isNum) {
    op = '*';
    left = false;
    dVal = "0";
  } else if (keyVal.equals("+") && !isNum) {
    op = '+';
    left = false;
    dVal = "0";
  } else if (keyVal.equals("=") && !isNum) {
    performCalc();
  } else if (keyVal.equals("C") && !isNum) {
    dVal = "0";
    l = 0.0;
    r = 0.0;
    res = 0.0;
    op = ' ';
    left = true;
  } else if (keyVal.equals(".") && !isNum) {
    if (left) {
      if (!dVal.contains(".")) {
        dVal += keyVal;
        l = float(dVal);
      } else if (!dVal.contains(".")) {
        dVal += keyVal;
        r = float(dVal);
      }
    }
  }
}
