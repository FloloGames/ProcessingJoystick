class Car {
  PVector pos;
  float size;
  float speed;
  Car() {
    pos = new PVector(width/2, height/2);
    speed = width/99;
    size = width/10;
  }
  void update(){
    show();
    move();
  }
  void show() {
    fill(255, 0, 0);
    rect(pos.x, pos.y, size, size);
  }
  void move() {
    PVector v = j.getValue();
    v.mult(speed);
    pos.add(v);
    pos.x = constrain(pos.x, size/2, width-size/2);
    pos.y = constrain(pos.y, size/2, height-size/2);
  }
}
