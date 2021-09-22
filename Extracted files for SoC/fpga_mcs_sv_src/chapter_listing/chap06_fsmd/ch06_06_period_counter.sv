// Listing 6.6
module period_counter
   (
    input  logic clk, reset,
    input  logic start, si,
    output logic ready, done_tick,
    output logic [9:0] prd
   );

   // constant declaration
   localparam CLK_MS_COUNT= 100000; // 1 ms tick
   // fsm state type 
   typedef enum {idle, waite, count, done} state_type;

   // signal declaration
   state_type state_reg, state_next;
   logic [16:0] t_reg, t_next;  // up to 100000
   logic [9:0] p_reg, p_next;   // up to 1 sec
   logic delay_reg;
   logic edg;

   // body
   // FSMD state & data registers
   always_ff @(posedge clk, posedge reset)
      if (reset)
         begin
            state_reg <= idle;
            t_reg <= 0;
            p_reg <= 0;
            delay_reg <= 0;
         end
      else
         begin
            state_reg <= state_next;
            t_reg <= t_next;
            p_reg <= p_next;
            delay_reg <= si;
         end

   // rising-edge tick
   assign edg = ~delay_reg & si;

   // FSMD next-state logic
   always_comb
   begin
      state_next = state_reg;
      ready = 1'b0;
      done_tick = 1'b0;
      p_next = p_reg;
      t_next = t_reg;
      case (state_reg)
         idle:
            begin
               ready = 1'b1;
               if (start)
                  state_next = waite;
            end
         waite: // wait for the first edge
            if (edg)
               begin
                  state_next = count;
                  t_next = 0;
                  p_next = 0;
               end
         count:
            if (edg)  // 2nd edge arrived
               state_next = done;
            else       // otherwise count
               if (t_reg == CLK_MS_COUNT-1) // 1 ms tick
                  begin
                     t_next = 0;
                     p_next = p_reg + 1;
                  end
               else
                  t_next = t_reg + 1;
         done:
            begin
               done_tick = 1'b1;
               state_next = idle;
            end
         default: state_next = idle;
      endcase
   end

   //ouput
   assign prd = p_reg;
endmodule
