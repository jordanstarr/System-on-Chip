// Listing 3.3
module prio_encoder_if
   (
    input logic [4:1] r,
    output logic [2:0] y
   );

   always_comb
      if (r[4])      
         y = 3'b100;
      else if (r[3]) 
         y = 3'b011;
      else if (r[2]) 
         y = 3'b010;
      else if (r[1]) 
         y = 3'b001;
      else
         y = 3'b000;
endmodule