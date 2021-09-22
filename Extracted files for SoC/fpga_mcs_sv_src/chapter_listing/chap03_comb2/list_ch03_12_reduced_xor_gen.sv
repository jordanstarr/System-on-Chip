// Listing 3.12
module reduced_xor_gen
  #(parameter N=8)
  (
   input  logic [N-1:0] a,
   output logic y  
  );
  
  // signal declaration
  logic [N-1:0] p;
  
  // body
  // set up input of the 1st stage
  assign p[0] = a[0];
  // replicated cascading-chain struture 
  generate
    genvar i;
    for (i = 1; i < N ; i = i + 1) 
      // an xor gate in each stage
      assign p[i] = a[i] ^ p[i-1]; 
  endgenerate
  // connect output from the last stage  
  assign y = p[N-1];
endmodule
