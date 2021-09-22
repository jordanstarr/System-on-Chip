// Listing 5.4
module edge_detect_mealy
   (
    input  logic clk, reset,
    input  logic level,
    output logic tick
   );

   // fsm state type 
   typedef enum {zero, one} state_type;

   // signal declaration
   state_type state_reg, state_next;

   // state register
    always_ff @(posedge clk, posedge reset)
       if (reset)
          state_reg <= zero;
       else
          state_reg <= state_next;

   // next-state logic and output logic
   always_comb
   begin
      state_next = state_reg;  // default state: the same
      tick = 1'b0;             // default output: 0
      case (state_reg)
         zero:
            if (level)
               begin
                  tick = 1'b1;
                  state_next = one;
               end
         one:
            if (~level)
               state_next = zero;
         default: state_next = zero;
      endcase
   end
endmodule