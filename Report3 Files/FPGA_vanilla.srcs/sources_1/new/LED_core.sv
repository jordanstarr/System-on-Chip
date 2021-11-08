`timescale 1ns / 1ps
// typical in and outs 
// need four registers for the num data 
// outputs are the led's


module LED_core(
    input logic clk,
    input logic reset,
    // slot interface
    input logic cs,
    input logic read,
    input logic write, //I think this needs to be changed to a 2 bit value because there are 4 options to write to
    input logic [4:0] addr,
    input logic [31:0] wr_data,
    output logic [31:0] rd_data,
    // external port    
    output logic [3:0] dout
    );
    
    logic [15:0] num_reg0, buf_reg0;
    logic [15:0] num_reg1, buf_reg1;
    logic [15:0] num_reg2, buf_reg2;
    logic [15:0] num_reg3, buf_reg3;
    
    logic enable; 
    
    Wrapper ledblinkie( 
        .clk(clk), 
        .reset_n(!reset),
        // connecting numbers to registers 
        .num0(num_reg0), 
        .num1(num_reg1), 
        .num2(num_reg2), 
        .num3(num_reg3),
        .led(dout)
        );
        
        always_ff @(posedge clk, posedge reset) begin 
            if (reset) begin 
                buf_reg0 <= 0; 
                buf_reg1 <= 0; 
                buf_reg2 <= 0; 
                buf_reg3 <= 0; 
            end
            else begin 
                if (enable && (addr == 0)) begin 
                    buf_reg0 <= wr_data[15:0];
                end
                if (enable && (addr == 1)) begin 
                    buf_reg1 <= wr_data[15:0];
                end
                if (enable && (addr == 2)) begin 
                    buf_reg2 <= wr_data[15:0];
                end
                if (enable && (addr == 3)) begin 
                    buf_reg3 <= wr_data[15:0];
                end
            end
        end

    assign enable = cs && write; 
    assign rd_data = 0; 
    
    assign num0 = buf_reg0; 
    assign num1 = buf_reg1; 
    assign num2 = buf_reg2; 
    assign num3 = buf_reg3;    
    
endmodule
