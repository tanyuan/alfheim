import controlP5.*;

class HiddenObject {
  int positionX;
  int positionY;
  ControlP5 numCtl;
  
  HiddenObject(int x, int y, String enable, String para, int beats, processing.core.PApplet theParent) {
    this.positionX = x;
    this.positionY = y;
 
    numCtl = new ControlP5(theParent);
    
    numCtl.addToggle(enable)
          .setPosition(this.positionX-60, this.positionY-100)
          .setSize(50, 20);
  
    numCtl.addSlider(para)
     .setPosition(this.positionX-60, this.positionY-160)
     .setSize(120, 20)
     .setRange(0, 2000)
     .setValue(beats)
     .setNumberOfTickMarks(21)
     .setColorCaptionLabel(color(20,20,20));
  }
  
}