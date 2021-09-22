`timescale 1ns / 1ps

module ssegDriver(
    input logic clk,
    input logic rst,
    input logic [7:0] ss0,
    input logic [7:0] ss1,
    input logic [7:0] ss2,
    input logic [7:0] ss3,
    output logic [7:0] sseg,
    output logic [7:0] an
    );
    
    logic [1:0]count; 
    logic [2:0]ssegCount; 
    
    counter#(.N(18), .M(2)) myCounter( 
        .clk(clk), 
        .rst(rst), 
        .count(count) 
        ); 

    always_comb 
        case(count) 
            0: begin 
                sseg = ss0; 
                an = 4'b1110; 
            end 
            1: begin 
                sseg = ss1; 
                an = 4'b1101; 
            end 
            2: begin 
                sseg = ss2; 
                an = 4'b1011; 
            end 
            default: begin 
                sseg = ss3; 
                an = 4'b0111; 
            end 
        endcase 
        
        //this will turn all of the anodes off
        assign an[7:4] = 4'b1111;    
    
endmodule