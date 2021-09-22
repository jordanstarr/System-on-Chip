// Listing 4.11
module free_run_bin_counter
   #(parameter N=8)
   (
    input  logic clk, reset,
    output logic max_tick,
    output logic [N-1:0] q
   );

   //signal declaration
   logic [N-1:0] r_reg;
   logic [N-1:0] r_next;

   // body
   // register
   always_ff @(posedge clk, posedge reset)
      if (reset)
         r_reg <= 0; 
      else
         r_reg <= r_next;

   // next-state logic
   assign r_next = r_reg + 1;
   // output logic
   assign q = r_reg;
   assign max_tick = (r_reg==2**N-1) ? 1'b1 : 1'b0;
endmodule