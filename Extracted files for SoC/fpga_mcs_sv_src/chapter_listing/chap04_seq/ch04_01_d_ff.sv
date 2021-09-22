// Listing 4.1
module d_ff
   (
    input  logic clk,
    input  logic d,
    output logic q
   );

   // body
   always_ff @(posedge clk)
      q <= d;
endmodule