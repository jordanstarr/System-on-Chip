`timescale 1ns / 1ps

module Wrapper(
    input clk,
    input reset_n,
    input [15:0] num0,
    input [15:0] num1,
    input [15:0] num2,
    input [15:0] num3,
    output [15:0] led
    );
    
    top led0( 
        .clk(clk), 
        .rst(!reset_n), 
        .num(16'b0000000011111010), 
        .led(led[0])
        );
        
    top led1( 
        .clk(clk), 
        .rst(!reset_n), 
        .num(16'b0000000111110100), 
        .led(led[1])
        );
        
    top led2( 
        .clk(clk), 
        .rst(!reset_n), 
        .num(16'b0000001111101000), 
        .led(led[2])
        );
        
    top led3( 
        .clk(clk), 
        .rst(!reset_n), 
        .num(16'b0000111110100000), 
        .led(led[3])
        );
    
    
endmodule
