// Listing 3.13
module reduced_xor_loop
   #(parameter N=8)
  (
   input  logic [N-1:0] a,
   output logic y  
  );
  
  always_comb 
  begin
     logic tmp; 
     tmp = a[0];
     for (int i=1; i<N; i=i+1)
        tmp = a[i] ^ tmp;
     y = tmp;
  end   
endmodule