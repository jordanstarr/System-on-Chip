// Listing 1.1
module eq1
   // I/O ports
   (
    input logic i0, i1,
    output logic eq
   );

   // signal declaration
   logic p0, p1;

   // body
   // sum of two product terms
   assign eq = p0 | p1;
   // product terms
   assign p0 = ~i0 & ~i1;
   assign p1 = i0 & i1;

endmodule