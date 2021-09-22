`timescale 1ns / 1ps

module top_timer ( 
    input logic clk, 
    input logic reset_n, 
    output logic [7:0] an, 
    output logic [7:0] sseg
    );

    logic [15:0] ms_count; 
    
     timer myTimer( 
        .clk(clk),
        .rst(!reset_n), 
        .ms_timer(ms_count)
        ); 
        
     dig_to_sseg myDig( 
        .digit(ms_count), 
        .sseg(sseg)
        );
    
    assign an[7:0] = 8'b11111110; 
    
endmodule 
