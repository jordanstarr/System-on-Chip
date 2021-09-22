// Listing 3.2
module eq2_poor_always
  (
   input logic [1:0] a, b,
   output logic aeqb  
  );

  logic eq0, eq1;  
  
  // comparator 0
  always @(a, b)
  begin
     // the order of statements is important
     logic tmp;
     tmp = 1'b0;
     tmp = tmp  | (~a[0] & ~b[0]);
     tmp = tmp  | (a[0] & b[0]);
     eq0 = tmp;
  end

  // comparator 1
  always @(a, b)
  begin
     // the order of statements is important
     logic tmp;
     tmp = 1'b0;
     tmp = tmp  | (~a[1] & ~b[1]);
     tmp = tmp  | (a[1] & b[1]);
     eq1 = tmp;
  end
  
  // and circuit 
  assign aeqb = eq0 & eq1;
endmodule