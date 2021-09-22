// Listing 4.5
module d_ff_sync_clr_2seg
   (
    input  logic clk,
    input  logic syn_clr,
    input  logic d,
    output logic q
   );

   // signal declaration
   logic r_reg, r_next;

   // body
   // D FF
   always_ff @(posedge clk)
      r_reg <= r_next;

   // next-state logic
   always_comb
      if (syn_clr)
         r_next = 1'b0;
      else
         r_next = d;

   // output logic
   assign q = r_reg;
endmodule