# Hidden Local Workshop: Alfheim

![Sender UI](sender.png)

## Requirements

- 3 Raspberry Pi's
- Processing
  - IO
  - OOCSI
  - controlP5
- Pure Data

## How to use

The code contains one for sender and three for receivers.

1. On sender machine, run Processing `Sender/Sender.pde`. This will open an interface for controlling the receiver machines.
2. On first receiver machine, run Pure Data `Receiver/PdOne/oscPDtest.pd`, then run Processing `Receiver/Receiver/One/ReceiverOne.pde`.
3. For the second and third receiver machine, similar to step 2.
