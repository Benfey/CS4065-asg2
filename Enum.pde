/** Enums **/
enum Shape { FREEFORM_LINE, STRAIGHT_LINE, RECTANGLE, OVAL }
enum Color { BLACK, RED, GREEN, BLUE }
enum Weight {
  THIN    (1),
  MEDIUM  (4),
  THICK   (8);

  private final int weight;
  private Weight(int w) { this.weight = w; }
  int getWeight() { return this.weight; }
}

/** Maps Color enum to color function */
color getColor() {
  switch (colour) {
    case BLACK:
      return color(0);
    case RED:
      return color(255, 0, 0);
    case GREEN :
      return color(0, 255, 0);
    case BLUE :
      return color(0, 0, 255);
    default:
       return color(255);
  }
}

/** Maps Weight enum to int thickness */
color getWeight() { return weight.getWeight(); }
