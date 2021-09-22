`timescale 1ns / 1ps

module top_level ( 
    input logic clk, 
    input logic reset_n, 
    output logic [7:0] an, 
    output logic [7:0] sseg
    );

    sseg_driver myDriver( 
        .clk(clk),
        .rst(!reset_n), 
        .an(an), 
        .sseg(sseg)
        );  
    
    
endmodule 