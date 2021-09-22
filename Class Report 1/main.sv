`timescale 1ns / 1ps

module main ( 
    input logic clk, 
    input logic reset_n, 
    output logic [7:0] an, 
    output logic [7:0] sseg
    );
    
    logic [7:0] ss0;
    logic [7:0] ss1;
    logic [7:0] ss2;
    logic [7:0] ss3; 
    
    rotator myRotator (
        .clk(clk), 
        .rst(!reset_n), 
        .ss0(ss0), 
        .ss1(ss1), 
        .ss2(ss2), 
        .ss3(ss3)        
    );
    
    sseg_driver myDriver (
        .clk(clk),
        .rst(!reset_n), 
        .ss0(ss0), 
        .ss1(ss1), 
        .ss2(ss2), 
        .ss3(ss3),
        .sseg(sseg), 
        .an(an) 
    );
    
endmodule 
