module pwm_enhanced
   #(parameter R=10) 
   (
    input  logic clk,
    input  logic reset,
    input  logic [R:0] duty,
    input  logic [31:0] dvsr,
    output logic pwm_out
   );

   // declaration
   logic [R-1:0] d_reg, d_next;
   logic [R:0] d_ext;
   logic pwm_reg, pwm_next;
   logic [31:0] q_reg, q_next;
   logic tick;
  
   // body 
   always_ff @(posedge clk, posedge reset)
      if (reset) begin
         d_reg <= 0;
         pwm_reg <= 0;
         q_reg <= 0;
      end 
      else begin
         d_reg <= d_next;
         pwm_reg <= pwm_next;
         q_reg <= q_next;
      end   
   // "prescale" counter
   assign q_next = (q_reg == dvsr) ? 0 : q_reg + 1;
   assign tick = q_reg==0;
   // duty cycle counter
   assign d_next = (tick) ? d_reg + 1 : d_reg;
   assign d_ext = {1'b0, d_reg};
   // comparison circuit 
   assign pwm_next = d_ext < duty;
   assign pwm_out = pwm_reg;
endmodule