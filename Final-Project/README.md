# Final Project: Noise Detector
## VHDL Files
* Clock Prescaler: [ClockPrescaler.vhd](./Test-4/ClockPrescaler.vhd)
* Digital to Analog Converter: [dac_if.vhd](./Test-4/dac_if.vhd)
* PdmDes: [PdmDes.vhd](./Test-4/PdmDes.vhd)
* Siren: [siren.vhd](./Test-4/siren.vhd)
* Tone: [tone.vhd](./Test-4/tone.vhd)
* Trigger: [trigger.vhd](./Test-4/trigger.vhd)
* Wail: [wail.vhd](./Test-4/wail.vhd)

Note: Files are from Test-4 as they are a stable build.

## Constraint Files
* Siren: [siren.xdc](./Test-4/siren.xdc)

## Required Hardware
* Pmod I2S
* Speaker with 3.5 mm connector
* Nexys A7-100T

## Inspiration for Project
These Youtube videos from GreatScott! were the inspiration behind this project. The Automatic Volume Adjuster gave me the idea to make a device to allow the user to have a safe listening volume. The Garage Alarm System gave me the inspiration for the trigger component of the system. I also love his catchphase "Stay Creative, and I will see you next Time!".
* [Movie Music has a LOUD PROBLEM! So I fixed that! (Automatic Volume Adjuster)](https://www.youtube.com/watch?v=j1V2I-otdzk&t=211s)
* [Transmitting an Alarm Signal with LoRa (600m)! || Improving my Garage Alarm System](https://www.youtube.com/watch?v=ItZwa1AdrpU&t=151s)

## Design Process
The design started by envisioning how this Noise Detector would function. I decided to use the DAC Siren lab as the alarm since the tone would be distiniguishable. Then, I realized I need a way to turn the siren off and on based on a 16-bit value. After learning that the bits from the digital microphone are not bundled in 16-bits, I learned I needed a PDM deserializer.

Originally, this project was going to use a haptic engine to tell when the noise was too loud. However, a haptic engine was not available, so a speaker was chosen as a replacement.The beeps from the siren can be heard as short beeps. The reason for the short beeps was to prevent an infinite loop where the microphone is constantly hearing the output of the speaker. 

## Compling in GHDL
To verify that my code worked and was implemented correctly, I used GHDL to analyze it. This is shown in the image below where the function ```ghdl -a [filename].vhd```  is used. 
Note: GHDL does not recognize the unsigned library in the Clock Prescaler but the code does compile in Vivado.
![This is an image](https://github.com/Arif12467/Digital-System-Design-AIA/blob/7b8bd913aee73f5f77140279de27b244691a78c5/Final-Project/Photos/Compile_ghdl.png)

## Block Diagram
The image below shows a block diagram of how the components are interconnected in VHDL.
![This is an image](https://github.com/Arif12467/Digital-System-Design-AIA/blob/a44baf73a26ff0c4343b454b6b6876ef8a4c46f0/Final-Project/Photos/Diagram_Block_1.png)

## Setting the Trigger Threshold
The trigger threshold is suppose to turn on the siren when the data is above at 16-bit number. For instance, Test 4 was set to 58,000, which corresponds to 1110001010010000. The 16-bit number is representative of voltage levels from Digital to Analog. This can be shown by this simple R-2R Ladder DAC, where higher order bits correspond to high voltages.

![This is an image](https://github.com/Arif12467/Digital-System-Design-AIA/blob/68d25267e4d8a728e3968ed98a3a46b49a44b56b/Final-Project/Photos/R-2R%20Ladder%20DAC.png)

## Addition of a Clock Prescaler
Test 3 was a sucessful model when the threshold was set to 58,000. However, the clock on the trigger was operating at 100 MHz. This meant that the speaker output was visible and switching on and off by noise, but it was switching so fast, the speaker played a static like sound.

## Vivado Implementation Instructions

### 1. Create a new RTL project _siren_ in Vivado Quick Start

* Create four new source files of file type VHDL called **_dac_if_**, **_tone_**, **_wail_**, **_trigger_**, **_PdmDes_** and **_siren_**

* Create a new constraint file of file type XDC called **_siren_**

* Choose Nexys A7-100T board for the project

* Click 'Finish'

* Click design sources and copy the VHDL code from dac_if.vhd, tone.vhd, wail.vhd, trigger.vhd, PdmDes.vhd, and siren.vhd

* Click constraints and copy the code from siren.xdc

### 2. Run synthesis

### 3. Run implementation and open implemented design

### 4. Generate bitstream, open hardware manager, and program device

* Click 'Generate Bitstream'

* Click 'Open Hardware Manager' and click 'Open Target' then 'Auto Connect'

* Click 'Program Device' then xc7a100t_0 to download siren.bit to the Nexys A7-100T board

## Schematic in Vivado
The image below shows a circuit schematic for how this system.

### Simplified Schematic
![This is an image](https://github.com/Arif12467/Digital-System-Design-AIA/blob/174430468ad1596b580289d7d346c03d3343fd79/Final-Project/Photos/Schematic_Dsgn.png)
### Full Schematic
![This is an image](https://github.com/Arif12467/Digital-System-Design-AIA/blob/174430468ad1596b580289d7d346c03d3343fd79/Final-Project/Photos/Schematic_Dsgn_Expanded.png)

## Implemented Design in Vivado
The image below shows the implemented design of the circuit in Vivado.

![This is an image](https://github.com/Arif12467/Digital-System-Design-AIA/blob/174430468ad1596b580289d7d346c03d3343fd79/Final-Project/Photos/Implement_Dsgn.png)

## Demonstration
The video below shows the implemented system on the Nexys A7-100T. Due to the need of noise to activate the siren, two videos were combined.

https://user-images.githubusercontent.com/78330724/163731023-f7c8cfb1-bf52-499d-85d6-ca14cd6d3fff.mp4

