`timescale 1ns / 1ps

module timer_test;

logic clk; 
logic reset_n;
logic [7:0] an; 
logic [7:0] sseg; 

top_timer myTimer ( 
    .clk(clk), 
    .reset_n(reset_n), 
    .an(an), 
    .sseg(sseg) 
    ); 

initial 
begin    
    #1; 
    #1;
    #1; 
    #10; 
    #1000; 
    #100000; 
    $stop; 
end



endmodule
