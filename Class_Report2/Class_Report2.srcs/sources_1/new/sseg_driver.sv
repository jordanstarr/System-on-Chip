`timescale 1ns / 1ps

module sseg_driver(
    input logic clk,
    input logic rst,
    input logic btnu, 
//    input logic [7:0] ss0,
//    input logic [7:0] ss1,
//    input logic [7:0] ss2,
//    input logic [7:0] ss3,
    output logic [7:0] sseg,
    output logic [7:0] an, 
    output logic [15:0] sw
    );
    
    logic [1:0]count; 
    logic [2:0]ssegCount; 
    
    logic [7:0] ss0; 
    logic [7:0] ss1; 
    logic [7:0] ss2; 
    logic [7:0] ss3; 
    
    counter#(.N(18), .M(2)) myCounter( 
        .clk(clk), 
        .rst(rst), 
        .count(count) 
        ); 

    always_comb
    begin 
        if (btnu)
            an = 4'b1111; 
            sw[0:0] = 1'b1;
        else
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
                   end
        end
        endcase 
        
        //this will turn all of the anodes off
        assign an[7:4] = 4'b1111;
           
        assign ss0 = 8'b11001111;
        assign ss1 = 8'b10001001;
        assign ss2 = 8'b11111111;
        assign ss3 = 8'b11111111;  
    
endmodule