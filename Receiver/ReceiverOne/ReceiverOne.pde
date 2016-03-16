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

NetAddress myRemoteLocation; 

boolean enable = false;
int beats = 0;

void setup() {
  size(200, 200);
  noStroke();

  OOCSI oocsi = new OOCSI(this, "receiver1", "localhost");
  
  oscP5 = new OscP5(this, 12000);
  myRemoteLocation = new NetAddress("127.0.0.1", 12001);
  oscP5.plug(this, "test", "/test");
}

void draw() {
  background(255);
  println("ENABLE:", enable);
  println("BEATS:", beats);
  
  playSound(enable, beats);
  delay(beats);
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