# Lab 4: Hex Calculator

## VHDL Files
### Hex Calculator
* Hex Calculator: [hexcalc.vhd](./hexcalc.vhd)
* Keypad: [keypad.vhd](./keypad.vhd)
* LED Decoder 16-bits: [leddec16.vhd](./leddec16.vhd)
### Modified Hex Calculator
* Hex Calculator: [hexcalc_1.vhd](./hexcalc_1.vhd)
* Keypad: [keypad.vhd](./keypad.vhd)
* LED Decoder 16-bits: [leddec16_1.vhd](./leddec16_1.vhd)
## Constraint Files
* Hex Calculator: [hexcalc.xdc](./hexcalc.xdc)
* Modified Hex Calculator: [hexcalc_1.xdc](./hexcalc_1.xdc)
## Required Hardware
* Pmod KYPD
* 2x6 Pin Cable

## Project 1: Hex Calculator
The implemented design of the circuit in Vivado is shown in the image below.

![This is an image](https://github.com/Arif12467/Digital-System-Design-AIA/blob/92850a7b7a2de9e637cb636f0f7146dfc14e7d1f/Assignment-6/implemented_design.png)

Note: When connecting 2x6 Pin Cable, make sure that the paw is facing upward on both the JA port on the Nexys A7 board and the Pmod KYPD.

The video below shows the Hex Calculator running on the Nexys A7 board. Addition is performed by entering an number using the Pmod KYPD and pressing the BTNU button on the board. By pressing the BTNL button, the board displays the result on the 7-Segment LED Display. To clear the calculator, press the BTNC button, which will return the display to zero.

697A + 258F = 8F09
or
27002 + 9615 = 36617

https://user-images.githubusercontent.com/78330724/156936821-67d4dfaa-e376-4c84-b175-77fbff806460.mp4



## Project 2: Modified Hex Calculator
The implemented design of the circuit in Vivado is shown in the image below.

![This is an image](https://github.com/Arif12467/Digital-System-Design-AIA/blob/92850a7b7a2de9e637cb636f0f7146dfc14e7d1f/Assignment-6/implemented_design_1.png)

The video below shows the Modified Hex Calculator running on the Nexys A7 board. The 7-Segment LED Display now supresses the leading zero. Subtraction is performed by entering an number using the Pmod KYPD and pressing the BTND button on the board.

258F - 56B = 2024
or
9615 – 1387 = 8228

https://user-images.githubusercontent.com/78330724/156936826-70dccf44-c204-4282-a276-967e2e624953.mp4

