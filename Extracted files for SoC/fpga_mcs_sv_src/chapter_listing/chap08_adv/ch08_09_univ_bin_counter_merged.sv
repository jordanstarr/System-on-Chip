// Listing 8.9
module univ_bin_counter_merged
   #(parameter N=8)
   (
    input  logic clk, reset,
    input  logic syn_clr, load, en, up,
    input  logic [N-1:0] d,
    output logic max_tick, min_tick,
    output logic [N-1:0] q
   );

   // declaration
   logic [N-1:0] r_reg;

   // body
   // register and next-state logic
   always_ff @(posedge clk, posedge reset)
      if (reset)
         r_reg <= 0;  
      else if (syn_clr)
         r_reg <= 0;
      else if (load)
         r_reg <= d;
      else if (en & up )
         r_reg <= r_reg + 1;
      else if (en & ~up )
         r_reg <= r_reg - 1;
      // no else branch since q <= q is implicitly implied

   // output logic
   assign q = r_reg;
   assign max_tick = r_reg==2**N-1;
   assign min_tick = r_reg==0;
endmodule
