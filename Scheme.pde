/** Input Scheme **/
// Shortcuts
void keyPressed() {
  switch (keyCode) {
    // 1
  case 49:
    shape = Shape.FREEFORM_LINE;
    break;
    // 2
  case 50:
    shape = Shape.STRAIGHT_LINE;
    break;
    // q
  case 81:
    colour = Color.BLACK;
    break;
    // w
  case 87:
    colour = Color.RED;
    break;
    // a
  case 65:
    weight = Weight.THIN;
    break;
    // s
  case 83:
    weight = Weight.MEDIUM;
    break;
    // Backspace
  case 8:
    delete = true;
    break;
  default: 
    break;
  }
  // Debugging info
  print("keyCode: " + keyCode);
  print("shape: " + shape.toString());
  print("colour: " + colour.toString());
  print("weight: " + weight.toString());
}


// Gestures
