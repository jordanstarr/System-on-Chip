// Listing 8.10
module fsm_eg_merged
   (
     input  logic clk, reset,
     input  logic a, b,
     output logic y0, y1
   );

   // fsm state type 
   typedef enum {s0, s1, s2} state_type;

   // signal declaration
   state_type state_reg;

   // state register and next-state logic
   always @(posedge clk, posedge reset)
      if (reset)
         state_reg <= s0;
      else
         case (state_reg)
            s0: 
              if (a)
                 if (b)
                    state_reg <= s2;
                 else
                    state_reg <= s1;
              else
                 state_reg <= s0;
            s1: 
              if (a)
                 state_reg <= s0;
              else
                 state_reg <= s1;
            s2: state_reg <= s0;
            default: state_reg <= s0;
         endcase

   // Moore output logic
   assign y1 = (state_reg==s0) || (state_reg==s1);

   // Mealy output logic
   assign y0 = (state_reg==s0) & a & b;
endmodule
