`timescale 1ns / 1ps

module pass(
    input logic [15:0] sw,
    output logic [15:0] led,
    input logic clk,
    input logic btnc, 
    input logic btnu
    );
    
    logic [15:0] signal;
    logic [15:0] signal_next; 
    logic [15:0] db; 
    logic rst; 
    logic load; 
    
    assign rst = btnc; 
    assign signal_next = load ? sw : signal; 
    
    always_ff @ (posedge clk, posedge btnc) 
        if (btnc) 
            signal <= 0; 
        else 
            signal <= signal_next; 
            
     db_fsm dbouncers( 
           .clk(clk), 
           .reset(rst), 
           .sw(btnu), 
           .db(load)
                ); 
      
     genvar i; 
     generate  
        for (i = 0; i < 16; i++)           
            db_fsm dbouncers( 
                .clk(clk), 
                .reset(rst), 
                .sw(sw[i]), 
                .db(db[i])
                ); 
    endgenerate 
    assign led = signal; 
    
endmodule
