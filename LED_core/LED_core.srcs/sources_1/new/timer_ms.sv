`timescale 1ns / 1ps
//tic should only be up one clock cycle
//counts in 10 nano second period 
// assign tick = (count == count value) 
// assign n_count = (count == count value)? 0:count  + 1

module timer_ms(
    input logic clk,
    input logic rst,
    output logic tick
    );
    
    logic [31:0] count, n_count; 
    parameter counts_per_ms = 20'b00011000011010100000; // this is 100,000 in binary 
    
    always_ff @(posedge clk, posedge rst)
      if(rst) begin
        count <= 0; 
      end
      else begin
        count <= n_count;
      end
      
    assign tick = (count == counts_per_ms); 
    assign n_count = (count == counts_per_ms)? 0 : count + 1; 
      
    
endmodule
