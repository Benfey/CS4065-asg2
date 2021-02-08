/** Imports **/
import java.util.ArrayList;

/** Globals **/
Shape shape = Shape.FREEFORM_LINE;
Color colour = Color.BLACK;
Weight weight = Weight.THIN;

ArrayList<PShape> shapeArray = new ArrayList<PShape>();
ArrayList<int[]> lineCoords = new ArrayList<int[]>();

int lineCount = 0;
int backgroundColor = 255;
int[] prevLine = new int[] {-1, -1};
int[] initCoords = new int[] {-1, -1};

Boolean newLine = true;
Boolean delete = false;

void setup() {
  size(600, 600);
  trackGestures();
}

void draw() {
  // Delete the previous shape
  if (delete) {
    if (shapeArray.size() > 0) {
      shapeArray.remove(shapeArray.size() - 1);
    }
    delete = false;
  }

  // Redraws all the shapes
  background(backgroundColor);
  for (PShape s : shapeArray) {
    shape(s);
  }

  /** Input Scheme **/
  // Show current selected Shape, Color and Weight
  showInputSelections();
  // Draw gestures when tracked
  strokeWeight(4);
  one.draw();

  /** Drawing Shapes **/
  // Set the stroke and weight before drawing the shape
  stroke(getColor());
  fill(getColor());
  strokeWeight(getWeight());
  switch (shape) {
    case FREEFORM_LINE: {
      if (mousePressed && mouseButton == LEFT) {
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
      break;
    }
    case STRAIGHT_LINE: {
      if (mousePressed && mouseButton == LEFT) {
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
      break;
    }
    case RECTANGLE: {
      if (mousePressed && mouseButton == LEFT) {
        // We don't need to redraw anything if the mouse is held in the same spot
        if (prevLine[0] != mouseX || prevLine[1] != mouseY) {
          if (!newLine) {
            shapeArray.remove(shapeArray.size() - 1);
          }

          PShape current_shape;

          // Set the initial anchor point for the line
          if (newLine) {
            initCoords[0] = mouseX;
            initCoords[1] = mouseY;
          }

          // Draw the square
          current_shape = createShape(RECT, initCoords[0], initCoords[1], mouseX - initCoords[0], mouseY - initCoords[1]);

          shapeArray.add(current_shape);

          newLine = false;
        }
      } else {
        initCoords[0] = -1;
        initCoords[1] = -1;
        newLine = true;
      }
      break;
    }
    case OVAL: {
      // TODO: Create Oval shape
    }
  }
}
