/** Input Scheme **/
// Shortcuts
void keyPressed() {
  switch (keyCode) {
    // 1
    case 49: { shape = Shape.FREEFORM_LINE; break; }
    // 2
    case 50: { shape = Shape.STRAIGHT_LINE; break; }
    // 3
    case 51: { shape = Shape.RECTANGLE; break; }
    // 4
    case 52: { shape = Shape.OVAL; break; }
    // q
    case 81: { colour = Color.BLACK; break; }
    // w
    case 87: { colour = Color.RED; break; }
    // e
    case 69: { colour = Color.GREEN; break; }
    // r
    case 82: { colour = Color.BLUE; break; }
    // a
    case 65: { weight = Weight.THIN; break; }
    // s
    case 83: { weight = Weight.MEDIUM; break; }
    // d
    case 68: { weight = Weight.THICK; break; }
    // Backspace
    case 8:{ delete = true; break; }
    default: break;
  }
}

// Gestures


// Add texts to show currently selected Shape, Color and Weight
void showInputSelections() {
  fill(0);
  text("Shape: " + shape,   width - 150, 15);
  text("Color: " + colour,  width - 150, 35);
  text("Weight: " + weight, width - 150, 55);
}
