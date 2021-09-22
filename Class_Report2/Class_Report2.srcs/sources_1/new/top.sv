`timescale 1ns / 1ps

module top(
    input logic clk, 
    input logic reset_n,
    input logic btnc, 
    input logic btnr, 
    input logic btnu, 
    
    output logic [7:0] an, 
    output logic [7:0] sseg,
    output logic LED
    );
    
    logic [7:0] ss0; 
    logic [7:0] ss1; 
    logic [7:0] ss2; 
    logic [7:0] ss3; 
    
    logic [15:0] decoder_disp; 
    
    state_machine SM (
        .clk(clk), 
        .rst(!reset_n), 
        .btnc(btnc), 
        .btnu(btnu), 
        .btnr(btnr), 
        .decoder_in(decoder_disp), 
        .LED(LED)
        ); 
        
    dig_to_sseg myDecode (
        .digit(decoder_disp), 
        .ss0(ss0), 
        .ss1(ss1), 
        .ss2(ss2), 
        .ss3(ss3)
        ); 
        
    ssegDriver myDriver (
        .clk(clk), 
        .rst(rst), 
        .ss0(ss0), 
        .ss1(ss1), 
        .ss2(ss2), 
        .ss3(ss3),
        .sseg(sseg), 
        .an(an)
        );
   
    
endmodule
