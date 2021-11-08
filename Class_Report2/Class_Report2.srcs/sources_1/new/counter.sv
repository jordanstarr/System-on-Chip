`timescale 1ns / 1ps

module counter#(parameter N=18, parameter M=2)(
    input logic clk,
    input logic rst,
    output logic [M-1:0] count
    );
    
    logic [N-1:0] state, nstate; 
    
    always_ff @(posedge clk, posedge rst) 
        if(rst)
            state <= 0; 
        else 
            state <= nstate; 
            
    assign nstate = state + 1; 
    
    assign count = state[N-1:N-M];         
    
endmodule


he will have to ask, there has been a fast speed and a slow speed, both are pretty slow in general, talk of gear ratios, he would have to pull someone in to answer, no not really, never thought to solve problemw ith control 

