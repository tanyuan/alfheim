import controlP5.*;

class HiddenObject {
  int positionX;
  int positionY;
  ControlP5 numCtl;
  
  HiddenObject(int x, int y, String para, int node, processing.core.PApplet theParent) {
    this.positionX = x;
    this.positionY = y;
    
    numCtl = new ControlP5(theParent);
  
    numCtl.addSlider(para)
     .setPosition(this.positionX-60, this.positionY-160)
     .setSize(120, 20)
     .setRange(2, 16)
     .setValue(node)
     .setNumberOfTickMarks(15)
     .setColorCaptionLabel(color(20,20,20));
  }
    
  void drawUI(int node) {
    this.drawCircles(node, 80);
  }  
  
  void drawCircles(int circlesNumber, int bigCircleNumber){
    float incrementalAngle = 0.0;
    float angle = incrementalAngle;

    for(int i = 0; i < circlesNumber; i++){
      ellipse(bigCircleNumber * cos(incrementalAngle) + this.positionX, 
              bigCircleNumber * sin(incrementalAngle) + this.positionY, 
              20, 20);
      incrementalAngle += TWO_PI / circlesNumber;  
    } 
  }
  
}