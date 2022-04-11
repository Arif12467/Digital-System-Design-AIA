# Final Project: Noise Detector [WIP]
## VHDL Files
* Digital to Analog Converter: [dac_if.vhd](./Test-3/dac_if.vhd)
* PdmDes: [PdmDes.vhd](./Test-3/PdmDes.vhd)
* Siren: [siren.vhd](./Test-3/siren.vhd)
* Tone: [tone.vhd](./Test-3/tone.vhd)
* Trigger: [trigger.vhd](./Test-3/trigger.vhd)
* Wail: [wail.vhd](./Test-3/wail.vhd)

## Constraint Files
* Siren: [siren.xdc](./Test-3/siren.xdc)

## Required Hardware
* Pmod I2S
* Speaker with 3.5 mm connector
* Nexys A7-100T

## Inspiration for Project
These Youtube videos from GreatScott! were the inspiration behind this project. The Automatic Volume Adjuster gave me the idea to make a device to allow the user to have a safe listening volume. The Garage Alarm System gave me the inspiration for the trigger component of the system. I also love his catchphase "Stay Creative, and I will see you next Time!"
* [Movie Music has a LOUD PROBLEM! So I fixed that! (Automatic Volume Adjuster)](https://www.youtube.com/watch?v=j1V2I-otdzk&t=211s)
* [Transmitting an Alarm Signal with LoRa (600m)! || Improving my Garage Alarm System](https://www.youtube.com/watch?v=ItZwa1AdrpU&t=151s)


## Block Diagram
The image below shows a block diagram of how the components are interconnected in VHDL
![This is an image](https://github.com/Arif12467/Digital-System-Design-AIA/blob/6f0d885db4483583b36218580d8c2fabab3ee80c/Final-Project/Photos/Block%20Diagram.png)

## Setting the Trigger Threshold
The trigger threshold is suppose to turn on the siren when the data is above at 16-bit number. For instance, Test 3 was set to 48,000, which corresponds to 1011101110000000. The 16-bit number is representative of voltage levels from Digital to Analog. This can be shown by this simple R-2R Ladder DAC, where higher order bits correspond to high voltages.

![This is an image](https://github.com/Arif12467/Digital-System-Design-AIA/blob/68d25267e4d8a728e3968ed98a3a46b49a44b56b/Final-Project/Photos/R-2R%20Ladder%20DAC.png)

## Schematic in Vivado
The image below shows a circuit schematic for how this system.

![This is an image](https://github.com/Arif12467/Digital-System-Design-AIA/blob/ca126b7eedb8c3bcdece4b6b9d9f679dae896851/Final-Project/Photos/Schematic.png)

## Implemented Design in Vivado
The image below shows the implemented design of the circuit in Vivado.

![This is an image](https://github.com/Arif12467/Digital-System-Design-AIA/blob/ca126b7eedb8c3bcdece4b6b9d9f679dae896851/Final-Project/Photos/Implemented%20Design.png)

## Demonstration [WIP]
The video below shows the implemented system on the Nexys A7-100T.
