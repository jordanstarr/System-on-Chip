`timescale 1ns / 1ps

module rotator#(parameter N = 3)(
    input logic clk,
    input logic rst,
    output logic [7:0] ss0,
    output logic [7:0] ss1,
    output logic [7:0] ss2,
    output logic [7:0] ss3
    );
 
parameter top    = 8'b10011100; 
parameter bottom = 8'b10100011; 
parameter off    = 8'b11111111;

logic [N-1:0] tally;     
        
counter#(.N(25), .M(3)) myCounter( 
    .clk(clk), 
    .rst(rst), 
    .count(tally) 
    );
   
always_comb 
    case(tally) 
        0: begin 
            ss0 = off;
            ss1 = off; 
            ss2 = off; 
            ss3 = top;             
        end 
        1: begin 
            ss0 = off;
            ss1 = off; 
            ss2 = top; 
            ss3 = off;             
        end 
        2: begin 
            ss0 = off;
            ss1 = top; 
            ss2 = off; 
            ss3 = off;             
        end 
        3: begin 
            ss0 = top;
            ss1 = off; 
            ss2 = off; 
            ss3 = off;             
        end 
        4: begin 
            ss0 = bottom ;
            ss1 = off; 
            ss2 = off; 
            ss3 = off;             
        end 
        5: begin 
            ss0 = off;
            ss1 = bottom; 
            ss2 = off; 
            ss3 = off;             
        end 
        6: begin 
            ss0 = off;
            ss1 = off; 
            ss2 = bottom; 
            ss3 = off;             
        end 
        7: begin 
            ss0 = off;
            ss1 = off; 
            ss2 = off; 
            ss3 = bottom;             
        end 
    endcase
endmodule