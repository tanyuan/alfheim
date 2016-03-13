import controlP5.*;

HiddenObject object1;
HiddenObject object2;
HiddenObject object3;

int node1;
int node2;
int node3;

void setup() {
  size(800, 400);  
  noStroke();
  
  object1 = new HiddenObject(120, 200, "node1", 6, this);
  object2 = new HiddenObject(400, 200, "node2", 16, this);
  object3 = new HiddenObject(680, 200, "node3", 9, this);
}

void draw() {
  background(200, 200, 200);

  object1.drawUI(node1);
  object2.drawUI(node2);
  object3.drawUI(node3);
}