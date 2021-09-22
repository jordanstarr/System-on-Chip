// Listing 8.11
module div_combined
   #(parameter W = 8)
   (
    input  logic clk, reset,
    input  logic start,
    input  logic [W-1:0] dvsr, dvnd,
    output logic ready, done_tick,
    output logic [W-1:0] quo, rmd
   );

   // fsm state type 
   typedef enum {idle, op, last, done} state_type;
   
   // number of counter bits (2^N * 20ns = 40ms)
   localparam CBIT = $clog2(W+1);  // # bits in counter

   // signal declaration
   state_type state_reg;
   logic [W-1:0] rh_reg, rl_reg, d_reg; 
   logic [CBIT-1:0] n_reg; 

   // fsmd registers and next-state logic
   always @(posedge clk, posedge reset)
   begin
      logic [W-1:0] rh_tmp;
      logic [CBIT-1:0] n_next;
      logic q_bit;
      if (reset) begin
         state_reg <= idle;
         rh_reg <= 0;
         rl_reg <= 0;
         d_reg <= 0;
         n_reg <= 0;
      end
      else begin
         //*************************************************
         // data path functional units 
         // to get intermediate results
         //*************************************************
         // compare and subtract circuit
         if (rh_reg >= d_reg) begin
               rh_tmp = rh_reg - d_reg;
               q_bit = 1'b1;
         end
         else begin
               rh_tmp = rh_reg;
               q_bit = 1'b0;
         end
         // index decrement circuit
         n_next = n_reg - 1;
         //*************************************************
         // state and data registers and next-state logic
         //*************************************************
         case (state_reg)
            idle: begin
               if (start) begin
                  rh_reg <= 0;
                  rl_reg <= dvnd;  // dividend
                  d_reg <= dvsr;   // divisor
                  n_reg <= W + 1;  // index
                  state_reg <= op;
               end
            end
            op: begin
               // shift rh and rl left
               rl_reg <= {rl_reg[W-2:0], q_bit};
               rh_reg <= {rh_tmp[W-2:0], rl_reg[W-1]};
               // decrease index
               n_reg <= n_next;
               if (n_next==1)
                  state_reg <= last;
            end
            last: begin // last iteration
               rl_reg <= {rl_reg[W-2:0], q_bit};
               rh_reg <= rh_tmp;
               state_reg <= done;
            end
            done:
               state_reg <= idle;
            default: state_reg <= idle;
         endcase
      end
   end
   // output
   assign quo = rl_reg;
   assign rmd = rh_reg;
   assign ready = state_reg==idle;
   assign done_tick = state_reg==done;
endmodule
