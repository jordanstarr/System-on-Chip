// Listing 1.6
module eq2_top
   (
    input logic [3:0] sw,
    output logic [0:0] led
   );

   // body
   // instantiate 2-bit comparator
   eq2 eq_unit (.a(sw[3:2]), .b(sw[1:0]), .aeqb(led[0]));
endmodule