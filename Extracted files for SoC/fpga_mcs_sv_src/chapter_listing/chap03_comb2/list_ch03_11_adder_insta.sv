// Listing 3.11
module adder_insta
   (
     input  logic [3:0] a4, b4,
     output logic [3:0] sum4,
     output logic c4,
     input  logic [7:0] a8, b8,
     output logic [7:0] sum8,
     output logic c8
   );

   // instantiate 8-bit adder
   adder_carry_para #(.N(8)) unit1
      (.a(a8), .b(b8), .sum(sum8), .cout(c8));

   // instantiate 4-bit adder
   adder_carry_para unit2
      (.a(a4), .b(b4), .sum(sum4), .cout(c4));
endmodule