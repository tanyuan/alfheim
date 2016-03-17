import controlP5.*;

class HiddenObject {
  int positionX;
  int positionY;
  ControlP5 cp5;
  
  HiddenObject(int x, int y, String enable, String para, int beats, processing.core.PApplet theParent) {
    this.positionX = x;
    this.positionY = y;
 
    cp5 = new ControlP5(theParent);
    
    cp5.addToggle(enable)
          .setPosition(this.positionX-60, this.positionY-100)
          .setSize(50, 20);
  
    cp5.addSlider(para)
     .setPosition(this.positionX-60, this.positionY-160)
     .setSize(120, 20)
     .setRange(0, 200)
     .setValue(beats)
     .setNumberOfTickMarks(41)
     .setColorCaptionLabel(color(20,20,20));
  }
}