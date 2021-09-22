// Listing 8.5
module ab_ff_2seg
   (
    input  logic clk,
    input  logic a, b,
    output logic q
   );

   logic q_next;

   // D FF
   always_ff @(posedge clk)
      q <= q_next;

   // combinational circuit
   always_comb
      q_next = a & b;
endmodule
