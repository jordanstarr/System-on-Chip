`timescale 1ns / 1ps


module timer_test();

logic clk, rst, tick;  

timer_ms timer (
    .clk(clk), 
    .rst(rst),
    .tick(tick)
    ); 
    
    always #0.005 clk = ~clk; 
    
    initial begin 
        rst = 1; 
        clk = 0; 
        #10; 
        rst = 0; 
        #1000000000;         
   end


endmodule
