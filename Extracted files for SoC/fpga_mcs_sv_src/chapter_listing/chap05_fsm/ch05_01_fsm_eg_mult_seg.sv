// Listing 5.1
module fsm_eg_mult_seg
   (
    input  logic clk, reset,
    input  logic a, b,
    output logic y0, y1
   );

   // fsm state type 
   typedef enum {s0, s1, s2} state_type;

   // signal declaration
   state_type state_reg, state_next;

   // state register
    always_ff @(posedge clk, posedge reset)
       if (reset)
          state_reg <= s0;
       else
          state_reg <= state_next;

   // next-state logic
   always_comb
      case (state_reg)
         s0: if (a)
               if (b)
                  state_next = s2;
               else
                  state_next = s1;
             else
                state_next = s0;
         s1: if (a)
               state_next = s0;
             else
               state_next = s1;
         s2: state_next = s0;
         default: state_next = s0;
      endcase

   // Moore output logic
   assign y1 = (state_reg==s0) || (state_reg==s1);

   // Mealy output logic
   assign y0 = (state_reg==s0) & a & b;
endmodule