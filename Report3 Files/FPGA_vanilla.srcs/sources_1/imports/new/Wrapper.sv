`timescale 1ns / 1ps

module Wrapper(
    input clk,
    input reset_n,
    input [15:0] num0,
    input [15:0] num1,
    input [15:0] num2,
    input [15:0] num3,
    output [3:0] led
    );
    
    top led0( 
        .clk(clk), 
        .rst(!reset_n), 
        .num(num0), 
        .led(led[0])
        );
        
    top led1( 
        .clk(clk), 
        .rst(!reset_n), 
        .num(num1),
        .led(led[1])
        );
        
    top led2( 
        .clk(clk), 
        .rst(!reset_n), 
        .num(num2), 
        .led(led[2])
        );
        
    top led3( 
        .clk(clk), 
        .rst(!reset_n), 
        .num(num3), 
        .led(led[3])
        );
    
    
endmodule
