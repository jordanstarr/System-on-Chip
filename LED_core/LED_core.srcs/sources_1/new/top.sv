`timescale 1ns / 1ps

module top(
    input clk,
    input rst,
    input [15:0] num, 
    output led
    );
    
    logic tick; 
    
    timer_ms timer( 
        .clk(clk), 
        .rst(rst), 
        .tick(tick)
        );
    
    LED_blinker blink1( 
        .clk(clk), 
        .rst(rst),
        .tick(tick), 
        .num(num), 
        .led(led)
        );
    
endmodule
