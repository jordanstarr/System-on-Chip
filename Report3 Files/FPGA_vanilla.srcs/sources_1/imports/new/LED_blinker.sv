`timescale 1ns / 1ps
//needs a 16 bit number to set freuency (comes from outside the whole thing) 
// if count is less than half of num, turn on. if great than half, turn off. 
// if count == num, restart count 
// to divide by 2, cut off the last but 

module LED_blinker(
    input logic clk, 
    input logic rst, 
    input logic tick,
    input logic [15:0] num, 
    output logic led
    );
    
    logic n_led;
    logic [15:0] ms_count; 
    
    initial begin 
        ms_count = 0; 
    end
    
    always_ff @(posedge clk, posedge rst) begin 
        if (rst) begin 
            led <= 0; 
        end
        else begin 
            led <= n_led ; 
        end
    end
    
    always @(posedge tick) begin 
        ms_count = ms_count + 1; 
        if (ms_count >= num) begin 
            ms_count = 0; 
        end
        else if (ms_count > num[15:1]) begin 
            n_led = 0; 
        end
        else if (ms_count <= num[15:1]) begin 
            n_led = 1;  
        end
    end 
    
endmodule
