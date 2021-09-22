// Listing 4.4
module d_ff_en_1seg
   (
    input  logic clk, reset,
    input  logic en,
    input  logic d,
    output logic q
   );

   // body
   always_ff @(posedge clk, posedge reset)
      if (reset)
         q <= 1'b0;
      else if (en)
         q <= d;
endmodule