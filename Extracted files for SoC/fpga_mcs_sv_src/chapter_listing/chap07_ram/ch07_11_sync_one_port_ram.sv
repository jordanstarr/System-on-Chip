// Listing 7.11
module sync_one_port_ram
   #(
    parameter DATA_WIDTH = 8, // number of bits
              ADDR_WIDTH = 10  // number of address bits
   )
   (
    input  logic clk,
    input  logic we_a, 
    input  logic [ADDR_WIDTH-1:0] addr_a,
    input  logic [DATA_WIDTH-1:0] din_a,
    output logic [DATA_WIDTH-1:0] dout_a
   );

   // signal declaration
   logic [DATA_WIDTH-1:0] ram [0:2**ADDR_WIDTH-1];
   logic [DATA_WIDTH-1:0] data_a_reg;

   // body
   always_ff @(posedge clk)
   begin
      // write operation
      if (we_a)
         ram[addr_a] <= din_a;
      // read operation
      data_a_reg <= ram[addr_a];
   end
   // output
   assign dout_a = data_a_reg;
endmodule