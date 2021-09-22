// Listing 5.2
module d_ff_reset
   (
    input  logic clk, reset,
    input  logic d,
    output logic q
   );

   // body
   always_ff @(posedge clk, posedge reset)
      if (reset)
         q <= 1'b0;
      else
         q <= d;
endmodule