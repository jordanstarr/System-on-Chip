// Listing 8.7
module bin_counter_merge
   #(parameter N=8)
   (
    input  logic clk, reset,
    output logic max_tick,
    output logic [N-1:0] q
   );

   // declaration
   logic [N-1:0] r_reg;

   // body
   // register and next-state logic
   always @(posedge clk, posedge reset) begin
      logic [N-1:0] r_next; // local variable declaration 
      if (reset)
         r_reg <= 0;  
      else begin
         // next-state logic
         r_next = r_reg + 1;
         // register
         r_reg <= r_next;
      end
   end   
   // output logic
   assign q = r_reg;
   assign max_tick = r_reg==2**N-1;
endmodule
