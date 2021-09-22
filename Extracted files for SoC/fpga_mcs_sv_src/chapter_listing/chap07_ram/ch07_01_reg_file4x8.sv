// Listing 7.1
module reg_file_4x8
   (
    input  logic clk,
    input  logic wr_en,
    input  logic [1:0] w_addr, r_addr,
    input  logic [7:0] w_data,
    output logic [7:0] r_data
   );

   // constant declaration
   localparam DATA_WIDTH = 8, // number of bits
              ADDR_WIDTH = 2; // number of address bits

   // signal declaration
   logic [DATA_WIDTH-1:0] array_reg [0:2**ADDR_WIDTH-1];
   logic [2**ADDR_WIDTH-1:0] en;

   // body

   // 4 registers 
   always_ff @(posedge clk)
      begin
         if (en[0])
            array_reg[0] <= w_data;
         if (en[1])
            array_reg[1] <= w_data;
         if (en[2])
            array_reg[2] <= w_data;
         if (en[3])
            array_reg[3] <= w_data;
      end

   // decoding logic for write address 
   always_comb
      if (~wr_en) 
         en = 4'b0000;
      else
        case(w_addr)
           2'b00: en = 4'b0001;
           2'b01: en = 4'b0010;
           2'b10: en = 4'b0100;
           default: en = 4'b1000;   // 2'b11
        endcase
   // read output muiplexing 
   always_comb
      case(r_addr)
         2'b00: r_data = array_reg[0];
         2'b01: r_data = array_reg[1];
         2'b10: r_data = array_reg[2]; 
         default: r_data = array_reg[3];  // 2'b11
     endcase
endmodule

