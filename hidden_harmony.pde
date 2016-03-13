import controlP5.*;

HiddenObject object1;
HiddenObject object2;
HiddenObject object3;

int[] soundprint1 = {1, 1, 1, 0, 1, 0};
int[] soundprint2 = {1, 0, 1, 0, 1, 0, 1, 1, 0, 1, 1, 0, 0, 1, 1, 0};
int[] soundprint3 = {0, 0, 1, 1, 1, 0, 0, 1, 1};

int node1;
int node2;
int node3;

void setup() {
  size(800, 400);  
  noStroke();
  
  object1 = new HiddenObject(120, 200, "node1", 6, soundprint1, this);
  object2 = new HiddenObject(400, 200, "node2", 16, soundprint2, this);
  object3 = new HiddenObject(680, 200, "node3", 9, soundprint3, this);
}

void draw() {
  background(200, 200, 200);

  object1.drawUI(node1);
  object2.drawUI(node2);
  object3.drawUI(node3);
}