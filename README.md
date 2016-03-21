# Alfheim

An internet of lights and sounds project.

![Sender UI](sender.png)

This concept is trying to represent the communication between different smart objects through the theory of how different sounds being composed together harmoniously (just like what DJs do, for example: mixing two songs ). The speed of songs or sounds is defined by the BPM(beat per minute) of each song or sound. If the BPM are the same, then sounds would be mix together perfectly. We apply this kind of concept into the connection of smart objects. We view the BPM of sound as the connection, and the sound as the status of working object. The frequency of the blinking light shows the basic speed of sound which the sound would follow. Each object will have its own sound pattern and characteristic. By using this kind of system, we can create different levels of communication between things.

## How it works

```
                          Sender
                     (PC/Raspberry Pi)
                      +-------------+
                      | Processing  |
                      +-------------+
                        |    |    |  OOCSI (Wi-Fi)
        +---------------+    |    +---------------+
        |                    |                    |
        v                    v                    v
   Receiver One        Receiver Two        Receiver Three  
  (Raspberry Pi)      (Raspberry Pi)       (Raspberry Pi)
 +-------------+      +-------------+      +-------------+ 
 | Processing  |      | Processing  |      | Processing  | 
 +-------------+      +-------------+      +-------------+ 
        |                    |                    |        
        v                    v                    v        
 +-------------+      +-------------+      +-------------+ 
 |  Pure Data  |      |  Pure Data  |      |  Pure Data  | 
 +-------------+      +-------------+      +-------------+ 

```

## What you need

- A PC
- 3 Raspberry Pi's
  - LEDs on GPIO 3 and 4
  - Speaker
- Processing
  - IO
  - OOCSI
  - controlP5
- Pure Data

## How to run

The code can run either on one PC (for simulation) or on one PC and three Raspberry Pi's.

1. On sender machine, run Processing `Sender/Sender.pde`. This will open an interface for controlling the receiver machines.
2. On the first receiver machine, run Pure Data `Receiver/PdOne/oscPDtest.pd`, then run Processing `Receiver/ReceiverOne/ReceiverOne.pde`. If you run othe code on a Raspberry Pi, uncomment the GPIO lines to get the lightings work.
3. For the second and the third receiver machine, similar to step 2.

## License

MIT
