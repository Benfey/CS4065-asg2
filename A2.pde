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
   switch (shape) {
    case FREEFORM_LINE:
      if(mousePressed) {
        stroke(getColor());
        strokeWeight(getWeight());
        line(mouseX, mouseY, pmouseX, pmouseY);
        break;
      }
    case STRAIGHT_LINE:
      stroke(getColor());
      strokeWeight(getWeight());
      // TODO: Not complete since we should allow the user to chose the
      // endpoint of the line.
      if(mousePressed) {
        beginShape(LINES);
        vertex(mouseX, mouseY);
        // TODO: This spoint should be draw over and over until a final
        // point is chosen.
        vertex(mouseX + 100, mouseY + 100);
        endShape(CLOSE);
      }
    }
}
