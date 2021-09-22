// Listing 3.1
module poor_eq1_always
  (
   input logic i0, i1,
   output logic eq 
  );

  always @(i0, i1) 
  begin
     // local variable declaration
     logic tmp;
     // the order of statements is importnat
     tmp = 1'b0;
     tmp = tmp  | (~i0 & ~i1);
     tmp = tmp  | (i0 & i1);
     eq = tmp;
  end
endmodule