// Listing 8.8
module bin_counter_compact
   #(parameter N=8)
   (
    input  logic clk, reset,
    output logic max_tick,
    output logic [N-1:0] q
   );

   // declaration
   logic [N-1:0] r_reg;

   // body
   always_ff @(posedge clk, posedge reset)
      if (reset)
         r_reg <= 0;
      else
         r_reg <= r_reg + 1;
  // output logic
   assign q = r_reg;
   assign max_tick = r_reg==2**N-1;
endmodule