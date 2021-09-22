// Listing 7.3
module reg_file_2_read_port
   #(
    parameter DATA_WIDTH = 8, // number of bits
              ADDR_WIDTH = 2  // number of address bits
   )
   (
    input  logic clk,
    input  logic wr_en,
    input  logic [ADDR_WIDTH-1:0] w_addr, r_addr1, r_addr2,
    input  logic [DATA_WIDTH-1:0] w_data,
    output logic [DATA_WIDTH-1:0] r_data1, r_data2
   );

   // signal declaration
   logic [DATA_WIDTH-1:0] array_reg [0:2**ADDR_WIDTH-1];

   // body
   // write operation
   always_ff @(posedge clk)
      if (wr_en)
         array_reg[w_addr] <= w_data;
   // read port 1
   assign r_data1 = array_reg[r_addr1];
   // read port 2
   assign r_data2 = array_reg[r_addr2];
endmodule