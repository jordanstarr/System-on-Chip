// Listing 4.8
module reg_reset
   (
    input  logic clk, reset,
    input  logic [7:0] d,
    output logic [7:0] q
   );

   // body
   always_ff @(posedge clk, posedge reset)
      if (reset)
         q <= 0;
      else
         q <= d;
endmodule