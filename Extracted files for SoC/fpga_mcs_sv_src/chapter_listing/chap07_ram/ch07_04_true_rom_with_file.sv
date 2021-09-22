// Listing 7.4
module true_rom_with_file
   (
    input  logic [3:0] addr,
    output logic [6:0] data
   );

   // signal declaration
   logic [6:0] hex_rom [0:15]; // ascending range
   
   // load initial values from file led_pattern.txt
   // content of led_pattern.txt:
   // 1000000 1111001 0100100 0110000 0011001 0010010 0000010 1111000
   // 0000000 0010000 0001000 0000011 1000110 0100001 0000110 0001110
   initial 
      $readmemb("led_pattern.txt", rom);
   
   // body
   assign data = hex_rom[addr];
endmodule