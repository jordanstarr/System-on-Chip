// Listing 8.2
module and_nonblock
  (
   input  logic a, b, c,
   output logic y
  );

  always_comb
  begin             // y$_{entry}$ =  y
     y <= a;        // y$_{exit}$ = a
     y <= y & b;    // y$_{exit}$ = y$_{entry}$ \& b
     y <= y & c;    // y$_{exit}$ = y$_{entry}$ \& c
  end               // y = y$_{exit}$
endmodule