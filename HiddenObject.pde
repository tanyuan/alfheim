import controlP5.*;

class HiddenObject {
  int positionX;
  int positionY;
  int[] soundprint;
  ControlP5 numCtl;
  
  HiddenObject(int x, int y, String para, int node, int[] soundprint, processing.core.PApplet theParent) {
    this.positionX = x;
    this.positionY = y;
    this.soundprint= soundprint;  
 
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
    
    // will crash when increase circledNumber
    for(int i = 0; i < circlesNumber; i++){
      if (this.soundprint[i] == 1) {
        fill(0, 116, 217);
      }
      else {
        fill(255);
      }
      ellipse(bigCircleNumber * cos(incrementalAngle) + this.positionX, 
              bigCircleNumber * sin(incrementalAngle) + this.positionY, 
              20, 20);
      incrementalAngle += TWO_PI / circlesNumber;  
    } 
  }
  
}