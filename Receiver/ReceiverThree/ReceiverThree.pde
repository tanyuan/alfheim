import nl.tue.id.oocsi.*;
import oscP5.*;
import netP5.*;

// **************************************************
// This examples requires a running OOCSI server!
//
// More information how to run an OOCSI server
// can be found here: https://iddi.github.io/oocsi/)
// **************************************************

OscP5 oscP5;
int count = 0;

NetAddress myRemoteLocation; 

boolean enable = false;
int beats = 0;

// frames per second
int fps = 60;

void setup() {
  frameRate(fps);
  size(200, 200);
  noStroke();

  OOCSI oocsi = new OOCSI(this, "receiver3", "localhost");
  
  oscP5 = new OscP5(this, 14000);
  myRemoteLocation = new NetAddress("127.0.0.1", 14001);
  oscP5.plug(this, "test", "/test");
}

void draw() {
  background(255);
  
  int period = fps*60/beats;
  count = frameCount % period;
  
  // Read from sender
  println("ENABLE:", enable);
  println("BEATS:", beats);
  
  // Double blinking
  fill(int(float(count)/period*255));
  ellipse(60, 100, 20, 20);
  fill(int((1-float(count)/period)*255));
  ellipse(140, 100, 20, 20);
 
  // Play sound with Pd
  if (count == 0) {
    playSound(enable, beats);
  }
}

void pulse(OOCSIEvent event) {
  count = 0;
}

void handleOOCSIEvent(OOCSIEvent event) {
  enable = event.getBoolean("enable", false);
  beats = event.getInt("beats", 0);
}

void playSound(boolean enable, int beats ) {

  OscMessage myOscMessage = new OscMessage("/test");
  // add a value (an integer) to the OscMessage
  myOscMessage.add(enable);
  myOscMessage.add(beats);
  // send the OscMessage to a remote location specified in myNetAddress
  oscP5.send(myOscMessage, myRemoteLocation);  
}