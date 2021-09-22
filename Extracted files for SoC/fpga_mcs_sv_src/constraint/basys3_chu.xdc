#====================================================================================================
# Clock signal
#====================================================================================================
set_property PACKAGE_PIN W5 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]
create_clock -period 10.000 -name sys_clk_pin -waveform {0.000 5.000} -add [get_ports clk]

#====================================================================================================
#Switches
#====================================================================================================
set_property PACKAGE_PIN V17 [get_ports {sw[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[0]}]
set_property PACKAGE_PIN V16 [get_ports {sw[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[1]}]
set_property PACKAGE_PIN W16 [get_ports {sw[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[2]}]
set_property PACKAGE_PIN W17 [get_ports {sw[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[3]}]
set_property PACKAGE_PIN W15 [get_ports {sw[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[4]}]
set_property PACKAGE_PIN V15 [get_ports {sw[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[5]}]
set_property PACKAGE_PIN W14 [get_ports {sw[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[6]}]
set_property PACKAGE_PIN W13 [get_ports {sw[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[7]}]
set_property PACKAGE_PIN V2 [get_ports {sw[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[8]}]
set_property PACKAGE_PIN T3 [get_ports {sw[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[9]}]
set_property PACKAGE_PIN T2 [get_ports {sw[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[10]}]
set_property PACKAGE_PIN R3 [get_ports {sw[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[11]}]
set_property PACKAGE_PIN W2 [get_ports {sw[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[12]}]
set_property PACKAGE_PIN U1 [get_ports {sw[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[13]}]
set_property PACKAGE_PIN T1 [get_ports {sw[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[14]}]
set_property PACKAGE_PIN R2 [get_ports {sw[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sw[15]}]


#====================================================================================================
#Buttons
#====================================================================================================
# ***** btn(0): btnu;  btn(1): btnr;  btn(2): btnd; btn(3): btnl;  btn(4): btnc;
set_property PACKAGE_PIN U18 [get_ports {btn[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {btn[4]}]
set_property PACKAGE_PIN T18 [get_ports {btn[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {btn[0]}]
set_property PACKAGE_PIN W19 [get_ports {btn[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {btn[3]}]
set_property PACKAGE_PIN T17 [get_ports {btn[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {btn[1]}]
set_property PACKAGE_PIN U17 [get_ports {btn[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {btn[2]}]


#====================================================================================================
# discrete LEDs
#====================================================================================================
set_property PACKAGE_PIN U16 [get_ports {led[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[0]}]
set_property PACKAGE_PIN E19 [get_ports {led[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[1]}]
set_property PACKAGE_PIN U19 [get_ports {led[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[2]}]
set_property PACKAGE_PIN V19 [get_ports {led[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[3]}]
set_property PACKAGE_PIN W18 [get_ports {led[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[4]}]
set_property PACKAGE_PIN U15 [get_ports {led[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[5]}]
set_property PACKAGE_PIN U14 [get_ports {led[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[6]}]
set_property PACKAGE_PIN V14 [get_ports {led[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[7]}]
set_property PACKAGE_PIN V13 [get_ports {led[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[8]}]
set_property PACKAGE_PIN V3 [get_ports {led[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[9]}]
set_property PACKAGE_PIN W3 [get_ports {led[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[10]}]
set_property PACKAGE_PIN U3 [get_ports {led[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[11]}]
set_property PACKAGE_PIN P3 [get_ports {led[12]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[12]}]
set_property PACKAGE_PIN N3 [get_ports {led[13]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[13]}]
set_property PACKAGE_PIN P1 [get_ports {led[14]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[14]}]
set_property PACKAGE_PIN L1 [get_ports {led[15]}]
set_property IOSTANDARD LVCMOS33 [get_ports {led[15]}]


#====================================================================================================
#7 segment display
#====================================================================================================
# sseg[7]: decimal point
set_property PACKAGE_PIN W7 [get_ports {sseg[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sseg[0]}]
set_property PACKAGE_PIN W6 [get_ports {sseg[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sseg[1]}]
set_property PACKAGE_PIN U8 [get_ports {sseg[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sseg[2]}]
set_property PACKAGE_PIN V8 [get_ports {sseg[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sseg[3]}]
set_property PACKAGE_PIN U5 [get_ports {sseg[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sseg[4]}]
set_property PACKAGE_PIN V5 [get_ports {sseg[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sseg[5]}]
set_property PACKAGE_PIN U7 [get_ports {sseg[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sseg[6]}]
set_property PACKAGE_PIN V7 [get_ports {sseg[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {sseg[7]}]
set_property PACKAGE_PIN U2 [get_ports {an[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[0]}]
set_property PACKAGE_PIN U4 [get_ports {an[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[1]}]
set_property PACKAGE_PIN V4 [get_ports {an[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[2]}]
set_property PACKAGE_PIN W4 [get_ports {an[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {an[3]}]


#====================================================================================================
# USB-RS232 Interface
#====================================================================================================
set_property PACKAGE_PIN B18 [get_ports rx]
set_property IOSTANDARD LVCMOS33 [get_ports rx]
set_property PACKAGE_PIN A18 [get_ports tx]
set_property IOSTANDARD LVCMOS33 [get_ports tx]


#====================================================================================================
# USB HID (PS/2)
#====================================================================================================
set_property PACKAGE_PIN C17 [get_ports ps2c]
set_property IOSTANDARD LVCMOS33 [get_ports ps2c]
set_property PULLUP true [get_ports ps2c]
set_property PACKAGE_PIN B17 [get_ports ps2d]
set_property IOSTANDARD LVCMOS33 [get_ports ps2d]
set_property PULLUP true [get_ports ps2d]


#====================================================================================================
# VGA Port
#====================================================================================================
set_property PACKAGE_PIN G19 [get_ports {rgb[8]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgb[8]}]
set_property PACKAGE_PIN H19 [get_ports {rgb[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgb[9]}]
set_property PACKAGE_PIN J19 [get_ports {rgb[10]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgb[10]}]
set_property PACKAGE_PIN N19 [get_ports {rgb[11]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgb[11]}]
set_property PACKAGE_PIN J17 [get_ports {rgb[4]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgb[4]}]
set_property PACKAGE_PIN H17 [get_ports {rgb[5]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgb[5]}]
set_property PACKAGE_PIN G17 [get_ports {rgb[6]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgb[6]}]
set_property PACKAGE_PIN D17 [get_ports {rgb[7]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgb[7]}]
set_property PACKAGE_PIN N18 [get_ports {rgb[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgb[0]}]
set_property PACKAGE_PIN L18 [get_ports {rgb[1]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgb[1]}]
set_property PACKAGE_PIN K18 [get_ports {rgb[2]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgb[2]}]
set_property PACKAGE_PIN J18 [get_ports {rgb[3]}]
set_property IOSTANDARD LVCMOS33 [get_ports {rgb[3]}]
set_property PACKAGE_PIN P19 [get_ports hsync]
set_property IOSTANDARD LVCMOS33 [get_ports hsync]
set_property PACKAGE_PIN R19 [get_ports vsync]
set_property IOSTANDARD LVCMOS33 [get_ports vsync]


#===============================================================================================
# PMOD xadc (JXADC)
#===============================================================================================
#Sch name = XA1_P
set_property IOSTANDARD LVCMOS33 [get_ports {adc_p[0]}]
#Sch name = XA2_P
set_property IOSTANDARD LVCMOS33 [get_ports {adc_p[1]}]
#Sch name = XA3_P
set_property IOSTANDARD LVCMOS33 [get_ports {adc_p[2]}]
#Sch name = XA4_P
set_property IOSTANDARD LVCMOS33 [get_ports {adc_p[3]}]
#Sch name = XA1_N
set_property IOSTANDARD LVCMOS33 [get_ports {adc_n[0]}]
#Sch name = XA2_N
set_property IOSTANDARD LVCMOS33 [get_ports {adc_n[1]}]
#Sch name = XA3_N
set_property IOSTANDARD LVCMOS33 [get_ports {adc_n[2]}]
#Sch name = XA4_N
set_property PACKAGE_PIN N2 [get_ports {adc_p[3]}]
set_property PACKAGE_PIN N1 [get_ports {adc_n[3]}]
set_property PACKAGE_PIN M2 [get_ports {adc_p[2]}]
set_property PACKAGE_PIN M1 [get_ports {adc_n[2]}]
set_property PACKAGE_PIN L3 [get_ports {adc_p[1]}]
set_property PACKAGE_PIN M3 [get_ports {adc_n[1]}]
set_property PACKAGE_PIN J3 [get_ports {adc_p[0]}]
set_property PACKAGE_PIN K3 [get_ports {adc_n[0]}]
set_property IOSTANDARD LVCMOS33 [get_ports {adc_n[3]}]


#====================================================================================================
#Pmod Headers JA/JB/JC
# 4 out of 10 pins are for Vcc/Gnd
# use two signals (for top and bottom rows) to maintain pin#
#====================================================================================================
set_property -dict {PACKAGE_PIN J1 IOSTANDARD LVCMOS33} [get_ports {ja_top[1]}]
set_property -dict {PACKAGE_PIN L2 IOSTANDARD LVCMOS33} [get_ports {ja_top[2]}]
set_property -dict {PACKAGE_PIN J2 IOSTANDARD LVCMOS33} [get_ports {ja_top[3]}]
set_property -dict {PACKAGE_PIN G2 IOSTANDARD LVCMOS33} [get_ports {ja_top[4]}]
set_property -dict {PACKAGE_PIN H1 IOSTANDARD LVCMOS33} [get_ports {ja_btm[7]}]
set_property -dict {PACKAGE_PIN K2 IOSTANDARD LVCMOS33} [get_ports {ja_btm[8]}]
set_property -dict {PACKAGE_PIN H2 IOSTANDARD LVCMOS33} [get_ports {ja_btm[9]}]
set_property -dict {PACKAGE_PIN G3 IOSTANDARD LVCMOS33} [get_ports {ja_btm[10]}]

set_property -dict {PACKAGE_PIN A14 IOSTANDARD LVCMOS33} [get_ports {jb_top[1]}]
set_property -dict {PACKAGE_PIN A16 IOSTANDARD LVCMOS33} [get_ports {jb_top[2]}]
set_property -dict {PACKAGE_PIN B15 IOSTANDARD LVCMOS33} [get_ports {jb_top[3]}]
set_property -dict {PACKAGE_PIN B16 IOSTANDARD LVCMOS33} [get_ports {jb_top[4]}]
set_property -dict {PACKAGE_PIN A15 IOSTANDARD LVCMOS33} [get_ports {jb_btm[7]}]
set_property -dict {PACKAGE_PIN A17 IOSTANDARD LVCMOS33} [get_ports {jb_btm[8]}]
set_property -dict {PACKAGE_PIN C15 IOSTANDARD LVCMOS33} [get_ports {jb_btm[9]}]
set_property -dict {PACKAGE_PIN C16 IOSTANDARD LVCMOS33} [get_ports {jb_btm[10]}]

set_property -dict {PACKAGE_PIN K17 IOSTANDARD LVCMOS33} [get_ports {jc_top[1]}]
set_property -dict {PACKAGE_PIN M18 IOSTANDARD LVCMOS33} [get_ports {jc_top[2]}]
set_property -dict {PACKAGE_PIN N17 IOSTANDARD LVCMOS33} [get_ports {jc_top[3]}]
set_property -dict {PACKAGE_PIN P18 IOSTANDARD LVCMOS33} [get_ports {jc_top[4]}]
set_property -dict {PACKAGE_PIN L17 IOSTANDARD LVCMOS33} [get_ports {jc_btm[7]}]
set_property -dict {PACKAGE_PIN M19 IOSTANDARD LVCMOS33} [get_ports {jc_btm[8]}]
set_property -dict {PACKAGE_PIN P17 IOSTANDARD LVCMOS33} [get_ports {jc_btm[9]}]
set_property -dict {PACKAGE_PIN R18 IOSTANDARD LVCMOS33} [get_ports {jc_btm[10]}]




##Quad SPI Flash
##Note that CCLK_0 cannot be placed in 7 series devices. You can access it using the
##STARTUPE2 primitive.
#set_property PACKAGE_PIN D18 [get_ports {QspiDB[0]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {QspiDB[0]}]
#set_property PACKAGE_PIN D19 [get_ports {QspiDB[1]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {QspiDB[1]}]
#set_property PACKAGE_PIN G18 [get_ports {QspiDB[2]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {QspiDB[2]}]
#set_property PACKAGE_PIN F18 [get_ports {QspiDB[3]}]
#set_property IOSTANDARD LVCMOS33 [get_ports {QspiDB[3]}]
#set_property PACKAGE_PIN K19 [get_ports QspiCSn]
#set_property IOSTANDARD LVCMOS33 [get_ports QspiCSn]

set_property BITSTREAM.GENERAL.COMPRESS TRUE [current_design]
set_property BITSTREAM.CONFIG.CONFIGRATE 33 [current_design]


