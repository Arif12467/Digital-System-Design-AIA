# Lab 5: DAC Siren

## VHDL Files
### DAC Siren
* Digital to Analog Converter: [dac_if.vhd](./dac_if.vhd)
* Siren: [siren.vhd](./siren.vhd)
* Tone: [tone.vhd](./tone.vhd)
* Wail: [wail.vhd](./wail.vhd)
### Modified DAC Siren
* Digital to Analog Converter: [dac_if.vhd](./dac_if.vhd)
* Siren: [siren_1.vhd](./siren_1.vhd)
* Tone: [tone_1.vhd](./tone_1.vhd)
* Wail: [wail_1.vhd](./wail_1.vhd)
## Constraint Files
* Siren: [siren.xdc](./siren.xdc)
* Modified Siren: [siren_1.xdc](./siren_1.xdc)
## Required Hardware
* Pmod I2S
* Speaker with 3.5 mm connector

## Project 1: DAC Siren
The implemented design of the circuit in Vivado is shown in the image below.

![This is an image](https://github.com/Arif12467/Digital-System-Design-AIA/blob/6fcc35d0ae56aa60341b35a3a28d5827b77c7ead/Assignment-7/implemented_design.png)

The video below shows the DAC Siren playing on speaker from the Nexys A7 board. Due to the loud sound of the siren, the speaker's volume was limited.

https://user-images.githubusercontent.com/78330724/156938294-b2708a8c-41df-4af1-bf87-bf6bfbe46ca2.mp4


## Project 2: Modified DAC Siren
The implemented design of the circuit in Vivado is shown in the image below.

![This is an image](https://github.com/Arif12467/Digital-System-Design-AIA/blob/6fcc35d0ae56aa60341b35a3a28d5827b77c7ead/Assignment-7/implemented_design_1.png)

The video below shows the modified DAC Siren playing on speaker from the Nexys A7 board. A second wail was added to drive the right audio channel. A square wave instead of a triangle wave is created when the BTNU button is pushed, changing the tone of the sound. The wailing speed is controlled by switches SW0 - SW7.

https://user-images.githubusercontent.com/78330724/156938301-90388e9b-8ac4-4bb1-87dd-7365fa698902.mp4

