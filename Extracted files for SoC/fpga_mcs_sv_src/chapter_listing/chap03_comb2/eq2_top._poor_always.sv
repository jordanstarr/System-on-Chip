// Listing 1.4
module eq2_top_poor_always
   (
    input logic [3:0] sw,
    output logic [0:0] led
   );

   // body
   // instantiate 2-bit comparator
   eq2_poor_always eq_unit (.a(sw[3:2]), .b(sw[1:0]), .aeqb(led[0]));
endmodule