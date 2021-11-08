// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
module mcs_top_vanilla(clk, reset_n, sw, led, rx, tx);
  input clk;
  input reset_n;
  input [15:0]sw;
  output [15:0]led;
  input rx;
  output tx;
endmodule
