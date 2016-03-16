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

// a NetAddress contains the ip address and port number of a remote location in the network.
NetAddress myRemoteLocation; 

int fillColor = 255;
int position = 0;

void setup() {
  size(200, 200);
  noStroke();

  // connect to OOCSI server running on the same machine (localhost)
  // with "receiverName" to be my channel others can send data to
  // (for more information how to run an OOCSI server refer to: https://iddi.github.io/oocsi/)
  OOCSI oocsi = new OOCSI(this, "receiverName", "localhost");

  // subscribe to channel "testchannel"
  // either the channel name is used for looking for a handler method...
  oocsi.subscribe("testchannel");
  // ... or the handler method name can be given explicitly
  // oocsi.subscribe("testchannel", "testchannel");
  
  // create a new instance of oscP5. 
  // 12000 is the port number you are listening for incoming osc messages.
  oscP5 = new OscP5(this, 12000);

  // create a new NetAddress. a NetAddress is used when sending osc messages
  // with the oscP5.send method.
  myRemoteLocation = new NetAddress("127.0.0.1", 12001);

  // with the plug method of oscP5 you can automatically forward
  // incoming osc messages with a specific address pattern (3rd parameter in the plug method)
  // and a specific typetag (typetag=parameters of plugged method) to a
  // specific method (2nd parameter) in your sketch.
  oscP5.plug(this, "test", "/test");  // create a new instance of oscP5. 
  // 12000 is the port number you are listening for incoming osc messages.
  oscP5 = new OscP5(this, 12000);

  // create a new NetAddress. a NetAddress is used when sending osc messages
  // with the oscP5.send method.
  myRemoteLocation = new NetAddress("127.0.0.1", 12001);

  // with the plug method of oscP5 you can automatically forward
  // incoming osc messages with a specific address pattern (3rd parameter in the plug method)
  // and a specific typetag (typetag=parameters of plugged method) to a
  // specific method (2nd parameter) in your sketch.
  oscP5.plug(this, "test", "/test");
}

void draw() {
  background(255);
  fill(fillColor, 120, 120);
  rect(20, position, 20, 20);

  if (frameCount % 18 == 10) 
    playSound(32);
  if (frameCount % 6 == 0) 
    playSound(40 + (frameCount % 10));
  if (frameCount % 12 == 0) 
    playSound(40 + (frameCount % 10) + 12);
  if (frameCount % 16 == 0) 
    playSound(40 + (frameCount % 10) + 15);
  if (position > width/2) {
    if (frameCount % 18 == 0) 
      playSound(30 + (frameCount % 10) + 26);
    if (frameCount % 18 == 8) 
      playSound(30 + (frameCount % 10) + 29);
  }
}

void testchannel(OOCSIEvent event) {

  // assign the new fill color from the OOCSI event
  fillColor = event.getInt("color", 0);

  // assign the new y position from the OOCSI event
  position = event.getInt("position", 0);
}

void playSound(int note) {

  OscMessage myOscMessage = new OscMessage("/test");
  // add a value (an integer) to the OscMessage
  myOscMessage.add(note);
  myOscMessage.add((int) map(mouseY, 0, height, 200, 1000));
  // send the OscMessage to a remote location specified in myNetAddress
  oscP5.send(myOscMessage, myRemoteLocation);
}