/** Global Variables **/
Shape shape = Shape.FREEFORM_LINE;
Color colour = Color.BLACK;
Weight weight = Weight.THIN;

PShape previous_shape, current_shape;

int backgroundColor = 102;
int[] prevLine = new int[] {-1, -1};
int[] initCoords = new int[] {-1, -1};

Boolean newLine = true;

void setup() {
  // TODO: Possibly full screen?
  size(640, 360);
  // TODO: Not sure if this is good for all colors?
  background(backgroundColor);
  // Initialize our shape 
  previous_shape = createShape();
  current_shape = createShape();
}

void draw() {
  switch (shape) {
  case FREEFORM_LINE:
    if (mousePressed) {
      stroke(getColor());
      strokeWeight(getWeight());
      line(mouseX, mouseY, pmouseX, pmouseY);
      break;
    }
  case STRAIGHT_LINE:

    stroke(getColor());
    strokeWeight(getWeight());

    if (mousePressed) {

      // We don't need to redraw anything if the mouse is held in the same spot
      if (prevLine[0] != mouseX || prevLine[1] != mouseY) {

        // Set previous line to invisible 
        if (!newLine) {
          previous_shape = current_shape;
          previous_shape.setVisible(false);
        }

        // Begin our new line 
        current_shape.beginShape(LINES);

        // Set the initial anchor point for the line
        if (newLine) {
          initCoords[0] = mouseX;
          initCoords[1] = mouseY;
        }

        // Draw the straight line 
        current_shape.vertex(initCoords[0], initCoords[1]);
        current_shape.vertex(mouseX, mouseY);

        // Finish the shape
        current_shape.endShape(CLOSE);

        shape(current_shape);

        // Set the destination point of the prevLine
        prevLine[0] = mouseX;
        prevLine[1] = mouseY;
        newLine = false;
      }
    } else {
      initCoords[0] = -1;
      initCoords[1] = -1;
      newLine = true;
    }
  }
}
