public class Joystick {
  PVector mainLoc;
  PVector stickLoc;

  PVector value;

  float mainRadius;
  float stickRadius;

  boolean onStick = false;

  boolean mouseDown = false;
  boolean mouseUp = true;
  Joystick(float x, float y, float rMain) {
    mainLoc = new PVector(x, y);
    stickLoc = new PVector(x, y);
    value = new PVector(0, 0);
    mainRadius = rMain;
    stickRadius = rMain/3;

    registerMethod("mouseEvent", this);
  }
  void update(float x, float y) {
    moveStick(x, y);
    show();
    updateValue();
  }
  void show() {
    fill(180);
    stroke(0);
    ellipse(mainLoc.x, mainLoc.y, mainRadius*2, mainRadius*2);

    fill(130);
    noStroke();
    ellipse(stickLoc.x, stickLoc.y, stickRadius*2, stickRadius*2);
  }
  void updateValue() {
    float x = map(stickLoc.x, mainLoc.x-mainRadius, mainLoc.x+mainRadius, -1, 1);
    float y = map(stickLoc.y, mainLoc.y-mainRadius, mainLoc.y+mainRadius, -1, 1);
    value.set(x, y);
  }
  void moveStick(float x, float y) {
    if (onStick) {
      float d = dist(x, y, mainLoc.x, mainLoc.y);
      if (d <= mainRadius) {
        stickLoc.set(x, y);
      } else {
        PVector sub = PVector.sub(new PVector(x, y), mainLoc);
        sub.normalize();
        stickLoc.set(mainLoc.x+(sub.x*mainRadius), mainLoc.y+(sub.y*mainRadius));
      }
    } else {
      stickLoc.set(mainLoc);
    }
  }
  PVector getValue() {
    return value;
  }
  void mouseEvent(final MouseEvent evt) {
    if (evt.getAction() == MouseEvent.PRESS) {
      mousePressed();
    } else if ( evt.getAction() == MouseEvent.RELEASE) {
      mouseReleased();
    }
  }
  void mousePressed() {
    float d = dist(mouseX, mouseY, mainLoc.x, mainLoc.y);
    if (d <= mainRadius) {
      onStick = true;
    } else {
      onStick = false;
    }
  }
  void mouseReleased() {
    onStick = false;
  }
}
