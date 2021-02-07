import java.util.ArrayList;

/** Global Variables **/
Shape shape = Shape.FREEFORM_LINE;
Color colour = Color.BLACK;
Weight weight = Weight.THIN;

ArrayList<PShape> shapeArray = new ArrayList<PShape>();
ArrayList<int[]> lineCoords = new ArrayList<int[]>();

int lineCount = 0;
int backgroundColor = 102;
int[] prevLine = new int[] {-1, -1};
int[] initCoords = new int[] {-1, -1};

Boolean newLine = true;
Boolean delete = false;

void setup() {
  // TODO: Possibly full screen?
  size(640, 360);
  // TODO: Not sure if this is good for all colors?
  background(backgroundColor);
}

void draw() {

  // Delete the previous shape
  if (delete) {
    if (shapeArray.size() > 0) {
      shapeArray.remove(shapeArray.size() - 1);
    }
    delete = false;
  }

  // Clear and redraw all of our shapes
  background(backgroundColor);
  for (PShape s : shapeArray) {
    shape(s);
  }

  switch (shape) {
    case FREEFORM_LINE: {
      stroke(getColor());
      strokeWeight(getWeight());

      if (mousePressed) {
        lineCount++;
        int[] cCoords = new int[]{mouseX, mouseY};
        int[] pCoords = new int[]{pmouseX, pmouseY};
        lineCoords.add(cCoords);
        lineCoords.add(pCoords);

        PShape freeformLine = createShape();
        freeformLine.beginShape(LINES);
        freeformLine.vertex(mouseX, mouseY);
        freeformLine.vertex(pmouseX, pmouseY);
        freeformLine.endShape(CLOSE);
        shapeArray.add(freeformLine);
        break;
      } else {
        // While in this mode, replace all the individual line segments into a
        // single PShape.
        if (lineCount > 0) {
          PShape placeholder = createShape();
          placeholder.beginShape(LINES);
          for (int[] pair: lineCoords) {
            placeholder.vertex(pair[0], pair[1]);
          }
          placeholder.endShape(CLOSE);
          shapeArray.subList(shapeArray.size()-lineCount, shapeArray.size()).clear();
          shapeArray.add(placeholder);
          lineCoords.clear();
        }

        lineCount = 0;
      }
    }
    case STRAIGHT_LINE: {
      stroke(getColor());
      strokeWeight(getWeight());

      if (mousePressed) {
        // We don't need to redraw anything if the mouse is held in the same spot
        if (prevLine[0] != mouseX || prevLine[1] != mouseY) {
          if (!newLine) {
            shapeArray.remove(shapeArray.size() - 1);
          }

          PShape current_shape = createShape();

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

          shapeArray.add(current_shape);

          newLine = false;
        }
      } else {
        initCoords[0] = -1;
        initCoords[1] = -1;
        newLine = true;
      }
    }
    case RECTANGLE: {
      // TODO: Create Rectangle shape
    }
    case OVAL: {
      // TODO: Create Oval shape
    }
  }
}
