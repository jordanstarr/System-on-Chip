`timescale 1ns / 1ps

module LED_blinker_test();

logic clk, rst; 
logic [15:0] ticks; 

timer_ms timer (
    .clk(clk), 
    .rst(rst),
    .ticks(ticks)
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
