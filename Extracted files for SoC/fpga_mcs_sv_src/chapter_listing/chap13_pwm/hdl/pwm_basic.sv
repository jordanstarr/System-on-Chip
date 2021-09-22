module pwm_basic
   #(parameter R=10)  // # bits of PWM resolution (i.e., 2^R levels)
   (
    input  logic clk,
    input  logic reset,
    input  logic [R-1:0] duty,
    output logic pwm_out
   );

   // declaration
   logic [R-1:0] d_reg, d_next;
   logic pwm_reg, pwm_next;
   
   // body 
   always_ff @(posedge clk, posedge reset)
      if (reset) begin
         d_reg <= 0;
         pwm_reg <= 0;
      end 
      else begin
         d_reg <= d_next;
         pwm_reg <= pwm_next;
     end
   // duty cycle counter
   assign d_next = d_reg + 1;
   // comparison circuit 
   assign pwm_next = d_reg < duty;
   assign pwm_out = pwm_reg;
endmodule