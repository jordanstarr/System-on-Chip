`timescale 1ns / 1ps

module random_num_generator#(parameter N = 25, M = 1) (
    input logic clk, 
    input logic rst,
    
    output logic [M-1:0] rand_num 
    );
    
    logic [N-1:0] R, nR; 
    logic tapResult; 
    
    always_ff @(posedge clk, posedge rst)
        if (rst)
           R <= {N{1'b1}};
        else
            R <= nR;  
    
    assign nR = {tapResult, R[N-1:1]}; //shift register
    assign tapResult = R[3] ^ R[0]; 
    
    assign rand_num = R[M-1:0];
    
endmodule
