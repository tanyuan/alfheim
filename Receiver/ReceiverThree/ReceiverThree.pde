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
int counts = 0;

NetAddress myRemoteLocation; 

boolean sync = false;

boolean enable = false;
int beats = 60;

// frames per second
int fps = 60;

void setup() {
  frameRate(fps);
  size(200, 200);
  noStroke();

  OOCSI oocsi = new OOCSI(this, "receiver3", "localhost");
  oocsi.subscribe("pulse");
  
  oscP5 = new OscP5(this, 14000);
  myRemoteLocation = new NetAddress("127.0.0.1", 14001);
  oscP5.plug(this, "test", "/test");
}

void draw() {
  background(255);
  
  counts += 1;
  
  int period = fps*60/beats;
  count = counts % period;
  
  if (sync) {
    background(0);
    count = 0;
    counts = 0;
    sync = false;
  }
  
  // Read from sender
  println("ENABLE:", enable);
  println("BEATS:", beats);
 
  // Play sound with Pd
  if (count == 0) {
    playSound(enable, beats);
  }
  if (count < period/2 ) {
    fill(0);
    ellipse(60, 100, 20, 20);
    fill(128);
    ellipse(140, 100, 20, 20);
    //GPIO.digitalWrite(4, GPIO.HIGH);
    //GPIO.digitalWrite(3, GPIO.LOW);
  }
  else {
    fill(128);
    ellipse(60, 100, 20, 20);
    fill(0);
    ellipse(140, 100, 20, 20);
    //GPIO.digitalWrite(4, GPIO.LOW);
    //GPIO.digitalWrite(3, GPIO.HIGH);
  }
}

void pulse(OOCSIEvent event) {
  sync = true;
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