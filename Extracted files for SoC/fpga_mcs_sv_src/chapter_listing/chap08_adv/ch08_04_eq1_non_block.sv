// Listing 8.4
module eq1_non_block
  (
  input  logic i0, i1,
  output logic eq
  );

  logic p0, p1;

  always_comb
  // the order of statements is not important
  begin               
     p0 <= ~i0 & ~i1; 
     p1 <= i0 & i1;   
     eq <= p0 | p1;   
  end                 
endmodule
