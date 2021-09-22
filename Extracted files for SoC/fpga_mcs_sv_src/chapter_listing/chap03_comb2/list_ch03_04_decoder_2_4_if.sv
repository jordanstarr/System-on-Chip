// Listing 3.4
module decoder_2_4_if
   (
    input logic [1:0] a,
    input logic en,
    output logic [3:0] y
   );

   always_comb
      if (en==1'b0)        // can be written as (~en)
         y = 4'b0000;
      else if (a==2'b00)
         y = 4'b0001;
      else if (a==2'b01)
         y = 4'b0010;
      else if (a==2'b10)
         y = 4'b0100;
      else
         y = 4'b1000;
endmodule