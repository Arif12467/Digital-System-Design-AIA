set_property -dict { PACKAGE_PIN E3 IOSTANDARD LVCMOS33 } [get_ports { clk_in }]; #IO_L12P_T1_MRCC_35 Sch=clk100mhz
create_clock -add -name sys_clk_pin -period 10.00 -waveform {0 5} [get_ports { clk_in }];

set_property -dict { PACKAGE_PIN D18 IOSTANDARD LVCMOS33 } [get_ports { dac_LRCK }]; #IO_L21N_T3_DQS_A18_15 Sch=ja[2]
set_property -dict { PACKAGE_PIN E18 IOSTANDARD LVCMOS33 } [get_ports { dac_SCLK }]; #IO_L21P_T3_DQS_15 Sch=ja[3]
set_property -dict { PACKAGE_PIN G17 IOSTANDARD LVCMOS33 } [get_ports { dac_SDIN }]; #IO_L18N_T2_A23_15 Sch=ja[4]
set_property -dict { PACKAGE_PIN C17 IOSTANDARD LVCMOS33 } [get_ports { dac_MCLK }]; #IO_L20N_T3_A19_15 Sch=ja[1]

set_property -dict { PACKAGE_PIN J5 IOSTANDARD LVCMOS33 } [get_ports { micClk }]; #IO_25_35 Sch=m_clk
set_property -dict { PACKAGE_PIN H5 IOSTANDARD LVCMOS33 } [get_ports { micData }]; #IO_L24N_T3_35 Sch=m_data
set_property -dict { PACKAGE_PIN F5 IOSTANDARD LVCMOS33 } [get_ports { micLRSel }]; #IO_0_35 Sch=m_lrsel