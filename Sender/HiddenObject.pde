import controlP5.*;

class HiddenObject {
  int positionX;
  int positionY;
  int [] pattern;
  ControlP5 cp5;
  
  HiddenObject(int x, int y, String enable, String para, int beats, int [] pattern, processing.core.PApplet theParent) {
    this.positionX = x;
    this.positionY = y;
    this.pattern = pattern;
 
    cp5 = new ControlP5(theParent);
    
    cp5.addToggle(enable)
          .setPosition(this.positionX-60, this.positionY-160)
          .setSize(50, 20);
  
    cp5.addSlider(para)
     .setPosition(this.positionX-60, this.positionY-120)
     .setSize(120, 20)
     .setRange(0, 200)
     .setValue(beats)
     .setNumberOfTickMarks(41)
     .setColorCaptionLabel(color(20,20,20));
  }
  
  void drawUI() {
    this.drawCircles(6, 60);
  }  
  
  void drawCircles(int circlesNumber, int bigCircleNumber){
    float incrementalAngle = 0.0;
    
    // will crash when increase circledNumber
    for(int i = 0; i < circlesNumber; i++){
      if (this.pattern[i] == 1) {
        fill(0, 116, 217);
      }
      else {
        fill(255);
      }
      ellipse(bigCircleNumber * cos(incrementalAngle) + this.positionX, 
              bigCircleNumber * sin(incrementalAngle) + this.positionY + 20, 
              20, 20);
      incrementalAngle += TWO_PI / circlesNumber;  
    } 
  }
}