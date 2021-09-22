// Listing 3.10
module adder_carry_para
   #(parameter N=4)
   (
     input logic [N-1:0] a, b,
     output logic [N-1:0] sum,
     output logic cout  // carry-out
   );

   // constant declaration
   localparam N1 = N-1;

   // signal declaration
   logic [N:0] sum_ext;

   //body
   assign sum_ext = {1'b0, a} + {1'b0, b};
   assign sum = sum_ext[N1:0];
   assign cout= sum_ext[N];
endmodule