# RGB to YUV Converter

## VHDL Files
* Architecture: [rgb2yuv.vhd](./rgb2yuv.vhd)
* Test Bench: [tb_rgb2yuv.vhd](./tb_rgb2yuv.vhd)
* Value Change Dump: [rgb2yuv.vcd](./rgb2yuv.vcd)

## GTKWave of Test Bench
![This is an image](https://github.com/Arif12467/Digital-System-Design-AIA/blob/9870f82eba5dd37abdab60019408e596e0595fc4/Assignment-2/rgb2yuv_gtkwave.png)

## Commands Used to Run VHDL files
```sh
$ ghdl -a rgb2yuv.vhdl
$ ghdl -a tb_rgb2yuv.vhdl
$ ghdl -e tb_rgb2yuv
$ ghdl -r tb_rgb2yuv --vcd=rgb2yuv.vcd
$ gtkwave rgb2yuv.vcd
```

## Citations
F. Cayci, “VHDL-digital-design/rgb2yuv.vhd ,” GitHub, 31-Oct-2019. [Online]. Available: https://github.com/fcayci/vhdl-digital-design/blob/master/rtl/rgb2yuv.vhd. [Accessed: 08-Feb-2022]. 

F. Cayci, “VHDL-digital-design/tb_rgb2yuv.vhd,” GitHub, 31-Oct-2019. [Online]. Available: https://github.com/fcayci/vhdl-digital-design/blob/master/tb/tb_rgb2yuv.vhd. [Accessed: 08-Feb-2022]. 
