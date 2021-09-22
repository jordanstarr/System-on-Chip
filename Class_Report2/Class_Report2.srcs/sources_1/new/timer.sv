//`timescale 1ns / 1ps

//module timer(
//    input logic clk,
//    input logic rst, 
    
//    output logic [15:0] ms_timer,
//    output logic [15:0] counter
//    );
    
//    logic [15:0] count_next;
//    logic [31:0] ms_next; 
    
//    parameter bin_millisecond = 24'b00011000011010100000;
    
//    // does things if you hit the reset button 
//    // else it is going to take the next stage and put it in the current stage 
//    // counter will always be going up one
//    always_ff @ (posedge clk, posedge rst) begin 
//        if (rst) begin
//            counter <= 0; 
//            ms_timer <= 0; 
//        end 
//        else begin
//            counter <= count_next; 
//            ms_timer <= ms_next;
//        end   
//    end
    
//    // basically this is just a counter 
//    always_comb begin 
//        if (counter == bin_millisecond) begin 
//            ms_next = ms_timer + 1; 
//            count_next = 0;
//        end
//        else begin  
//            count_next = counter + 1; 
//            ms_next = ms_timer;
//        end
//    end
    
//endmodule

`timescale 1ns / 1ps


module timer(
    input logic clk,
    input logic rst,
    output logic [15:0] ms_ticks
    );
    
    logic [31:0] ncount, count;
    logic [15:0] ms_next;
    parameter MS = 20'b00011000011010100000;
    
    
    always_ff @(posedge clk, posedge rst)
      if(rst)
            begin
            count <=0; 
            ms_ticks <= 0;
            end
        else
            begin
            count<=ncount;
            ms_ticks <= ms_next;
            end
        
    always_comb
        if(count != MS)
            begin
            ncount = count + 1;
            ms_next = ms_ticks;
            end
        else if(count == MS)
            begin
            ms_next = ms_ticks + 1;
            ncount = 0;
            end
    
    
endmodule
