// Copyright 1986-2017 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2017.2 (win64) Build 1909853 Thu Jun 15 18:39:09 MDT 2017
// Date        : Fri Nov 24 22:35:35 2017
// Host        : Lenovo-PC running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode synth_stub {C:/Users/pongchu/Google
//               Drive/code_listing/fpro_src/hdl/sys/mcs_v2017/cpu_stub.v}
// Design      : cpu
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7a35tcpg236-1
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "bd_3914,Vivado 2017.2" *)
module cpu(Clk, Reset, IO_addr_strobe, IO_address, 
  IO_byte_enable, IO_read_data, IO_read_strobe, IO_ready, IO_write_data, IO_write_strobe)
/* synthesis syn_black_box black_box_pad_pin="Clk,Reset,IO_addr_strobe,IO_address[31:0],IO_byte_enable[3:0],IO_read_data[31:0],IO_read_strobe,IO_ready,IO_write_data[31:0],IO_write_strobe" */;
  input Clk;
  input Reset;
  output IO_addr_strobe;
  output [31:0]IO_address;
  output [3:0]IO_byte_enable;
  input [31:0]IO_read_data;
  output IO_read_strobe;
  input IO_ready;
  output [31:0]IO_write_data;
  output IO_write_strobe;
endmodule
