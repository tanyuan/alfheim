import nl.tue.id.oocsi.*;
import controlP5.*;

// **************************************************
// This examples requires a running OOCSI server!
//
// More information how to run an OOCSI server
// can be found here: https://iddi.github.io/oocsi/)
// **************************************************

OOCSI oocsi;

HiddenObject object1;
HiddenObject object2;
HiddenObject object3;

int beats1;
int beats2;
int beats3;

boolean enable1 = false;
boolean enable2 = false;
boolean enable3 = false;

void setup() {
  size(800, 400);
  background(120);
  frameRate(10);
  noStroke();

  // connect ot OOCSI server running on the same machine (localhost)
  // with "senderName" to be my channel others can send data to
  // (for more information how to run an OOCSI server refer to: https://iddi.github.io/oocsi/)
  oocsi = new OOCSI(this, "senderName", "localhost");
  
  object1 = new HiddenObject(120, 200, "enable1", "beats1", 1000, this);
  object2 = new HiddenObject(400, 200, "enable2", "beats2", 500, this);
  object3 = new HiddenObject(680, 200, "enable3", "beats3", 200, this);
}

void draw() {
  background(200, 200, 200);
  
  // send to OOCSI ...
  oocsi
    // on channel "testchannel"...
  .channel("testchannel")
    // data labeled "color"...
    .data("color", mouseX)
      // data labeled "position"...
      .data("position", mouseY)
        // send finally
        .send();
        
  oocsi
  .channel("receiver1")
    .data("enable", enable1)
      .data("beats", beats1)
        .send();
        
  oocsi
  .channel("receiver2")
    .data("enable", enable2)
      .data("beats", beats2)
        .send();
        
  oocsi
  .channel("receiver3")
    .data("enable", enable3)
      .data("beats", beats3)
        .send();
}