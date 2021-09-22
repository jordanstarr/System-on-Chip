// Listing 3.18
module barrel_shifter_case
   (
     input  logic [7:0] a,
     input  logic [2:0] amt,
     output logic [7:0] y
    );

   // body
   always_comb
      case(amt)
         3'o0: y = a;
         3'o1: y = {a[0], a[7:1]};
         3'o2: y = {a[1:0], a[7:2]};
         3'o3: y = {a[2:0], a[7:3]};
         3'o4: y = {a[3:0], a[7:4]};
         3'o5: y = {a[4:0], a[7:5]};
         3'o6: y = {a[5:0], a[7:6]};
         default: y = {a[6:0], a[7]};
      endcase
endmodule