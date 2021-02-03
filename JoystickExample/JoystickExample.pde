Joystick j;
Car c;
void setup() {
  rectMode(CENTER);
  size(600, 600);
  j = new Joystick(width/2, height/1.25, width/10);
  c = new Car();
}
void draw() {
  background(0);
  c.update();
  j.update(mouseX, mouseY);
}
