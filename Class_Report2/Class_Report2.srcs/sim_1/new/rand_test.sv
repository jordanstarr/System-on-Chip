`timescale 1ns / 1ps

module rand_test( );

parameter N = 25; 
parameter M = 4; 

logic clk = 0; 
logic rst; 
logic [M-1:0] rand_num; 

random_num_generator #(.N(N), .M(M)) DUT (
    .clk(clk), 
    .rst(rst), 
    .rand_num(rand_num)
    );
    
always 
    #5 clk=~clk; 
    
initial begin 
    rst = 0; 
    #2 rst = 1; 
    #2 rst = 0; 
end
    
endmodule
