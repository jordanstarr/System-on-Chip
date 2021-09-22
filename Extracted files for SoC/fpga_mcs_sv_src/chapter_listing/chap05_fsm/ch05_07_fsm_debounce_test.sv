// Listing 5.7
module debounce_test
   (
    input logic clk, 
    input logic [1:0] btn,
    output logic [3:0] an,
    output logic [7:0] sseg
   );

   // signal declaration
   logic [7:0]  b_reg, d_reg;
   logic [7:0] b_next, d_next;
   logic  btn_reg, db_reg;
   logic db_level, db_tick, btn_tick, clr;

   //
   // instantiate 7-seg LED display time-multiplexing module
   disp_hex_mux disp_unit
      (.clk(clk), .reset(1'b0),
       .hex3(b_reg[7:4]), .hex2(b_reg[3:0]),
       .hex1(d_reg[7:4]), .hex0(d_reg[3:0]),
       .dp_in(4'b1011), .an(an), .sseg(sseg));

   // instantiate debouncing circuit
   db_fsm db_unit
      (.clk(clk), .reset(1'b0), .sw(btn[1]), .db(db_level));

   // edge detection circuits
   always_ff @(posedge clk)
      begin
         btn_reg <= btn[1];
         db_reg <= db_level;
      end
   assign btn_tick = ~btn_reg & btn[1];
   assign db_tick = ~db_reg & db_level;

   // two counters
   assign clr = btn[0];
   always_ff @(posedge clk)
      begin
         b_reg <= b_next;
         d_reg <= d_next;
      end
   assign b_next = (clr)      ? 8'b0 :
                   (btn_tick) ? b_reg + 1 : b_reg;
   assign d_next = (clr)      ? 8'b0 :
                   (db_tick)  ? d_reg + 1 : d_reg;
endmodule
