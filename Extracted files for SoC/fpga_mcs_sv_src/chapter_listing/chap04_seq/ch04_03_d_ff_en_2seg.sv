// Listing 4.3
module d_ff_en_2seg
   (
    input  logic clk, reset,
    input  logic en,
    input  logic d,
    output logic q
   );

   // signal declaration
   logic r_reg, r_next;

   // body
   // D FF
   always_ff @(posedge clk, posedge reset)
      if (reset)
         r_reg <= 1'b0;
      else
         r_reg <= r_next;

   // next-state logic
   always_comb
      if (en)
         r_next = d;
      else
         r_next = r_reg;

   // output logic
   assign q = r_reg;
endmodule