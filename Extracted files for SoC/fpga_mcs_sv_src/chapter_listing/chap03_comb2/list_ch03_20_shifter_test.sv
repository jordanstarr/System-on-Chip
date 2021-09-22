// Listing 3.20
module shifter_test
   (
    input  logic [2:0] btn,
    input  logic [7:0] sw,
    output logic [7:0] led
   );

   // instantiate shifter
   barrel_shifter_stage shift_unit
      (.a(sw), .amt(btn), .y(led));
endmodule