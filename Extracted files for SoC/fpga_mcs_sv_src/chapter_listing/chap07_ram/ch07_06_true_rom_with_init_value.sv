// Listing 7.6
// NOT supported by Vivado 2016.4
module true_rom_with_init_value
   (
    input logic [3:0] addr,
    output logic [6:0] data
   );

   // signal declaration (with ascending range)
   logic [6:0] HEX_ROM [0:15]='{
      7'b1000000,    // addr 00
      7'b1111001,    // addr 01
      7'b0100100,    // addr 02
      7'b0110000,    // addr 03
      7'b0011001,    // addr 04
      7'b0010010,    // addr 05
      7'b0000010,    // addr 06
      7'b1111000,    // addr 07
      7'b0000000,    // addr 08
      7'b0010000,    // addr 09
      7'b0001000,    // addr 10
      7'b0000011,    // addr 11
      7'b1000110,    // addr 12
      7'b0100001,    // addr 13
      7'b0000110,    // addr 14
      7'b0001110     // addr 15
    } ; 
   
   // body
   assign data = HEX_ROM[addr];
endmodule
