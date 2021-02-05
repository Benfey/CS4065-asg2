/** Global Variables **/
Shape shape = Shape.FREEFORM_LINE;
Color colour = Color.BLACK;
Weight weight = Weight.THIN;

// Can we use layers to keep track of previous drawings?
// PGraphics[] layers = new PGraphics[3];

int backgroundColor = 102;
int[] prevLine = new int[] {-1, -1};
int[] initCoords = new int[] {-1, -1};

Boolean newLine = true;

void setup() {
  // TODO: Possibly full screen?
  size(640, 360);
  // TODO: Not sure if this is good for all colors?
  background(backgroundColor);
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
        
        // Draw over the previous line with the BG color if it exists
        if (!newLine) {
          beginShape(LINES);
          stroke(backgroundColor);
          strokeWeight(4);
          vertex(initCoords[0], initCoords[1]);
          vertex(prevLine[0], prevLine[1]);
          stroke(getColor());
          strokeWeight(getWeight());
          endShape(CLOSE);
        }
        
        // Begin our new line 
        beginShape(LINES);
        
        // Set the initial anchor point for the line
        if (newLine) {
          initCoords[0] = mouseX;
          initCoords[1] = mouseY;
        }
        
        // Draw the straight line 
        vertex(initCoords[0], initCoords[1]);
        vertex(mouseX, mouseY);
        
        // Finish the shape
        endShape(CLOSE);
        
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
