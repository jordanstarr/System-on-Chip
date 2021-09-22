// Listing 8.1
module and_block
  (
   input  logic a, b, c,
   output logic y
  );

  always_comb
  begin
     y = a;
     y = y & b;
     y = y & c;
  end
endmodule