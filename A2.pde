/** ENUMS **/
enum Shape { FREEFORM_LINE, STRAIGHT_LINE, RECTANGLE, OVAL }
enum Color { BLACK, RED, GREEN, BLUE }
enum Weight { THIN, MEDIUM, THICK }

/** Global Variables **/
Shape shape = Shape.FREEFORM_LINE;
Color colour = Color.BLACK;
Weight weight = Weight.THIN;

void setup() {
  // TODO: Possibly full screen?
  size(640, 360);
  // TODO: Not sure if this is good for all colors?
  background(102);
}

void draw() {
  // Only trigger draw even on mousePressed
  if (mousePressed == true) {
    // Determine shape
    // TODO: Create other cases
    switch (shape) {
      case FREEFORM_LINE:
        // Helper functions to map stroke and strokeWeight from Enums
        stroke(getColor());
        strokeWeight(getWeight());
        line(mouseX, mouseY, pmouseX, pmouseY);
      break;
    }
  }
}

// Super basic shortcut for proof of concept
void keyPressed() {
  // When pressing "1"
  if(keyCode == 49) {
    // Change the color BLUE and THIN
    colour = Color.BLUE;
    weight = Weight.THIN;
  } else {
    // Otherwise change it to BLACK and THICK
    colour = Color.BLACK;
    weight = Weight.THICK;
  }
}

/** Maps Color enum to color function */
color getColor() {
  switch (colour) {
    case BLUE :
      return color(0, 0, 255);
    case BLACK:
      return color(0);
    default:
       return color(255);
  }
}

/** Maps Weight enum to int thickness */
color getWeight() {
  switch (weight) {
    case THIN :
      return 1;
    case MEDIUM :
      return 4;
    case THICK :
      return 10;
    default:
      return 1;
  }
}
