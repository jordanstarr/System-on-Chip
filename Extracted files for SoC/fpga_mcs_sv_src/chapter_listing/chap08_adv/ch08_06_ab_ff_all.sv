// Listing 8.6
module ab_ff_all
   (
    input  logic clk,
    input  logic a, b,
    output logic q0, q1, q2, q3, q4, q5
   );

   logic ab0, ab1, ab2, ab3, ab4, ab5;

   //  attempt 0
   always_ff @(posedge clk)
   begin
      ab0 = a & b;
      q0 <= ab0;
   end

   // attempt 1
   always_ff @(posedge clk)
   begin            // ab1$_{entry}$ = ab1; q1$_{entry}$ = q1;
      ab1 <= a & b; // ab1$_{deferred}$ = a & b
      q1 <= ab1;    // q1$_{deferred}$ = ab1$_{entry}$
   end              // ab1 = ab1$_{deferred}$; q1 = q1$_{deferred}$

   // attempt 2
   always_ff @(posedge clk)
   begin
      ab2 = a & b;
      q2 = ab2;
   end

   // attempt 3 (switch the order of attempt 0)
   always_ff @(posedge clk)
   begin
      q3 <= ab3;
      ab3 = a & b;
   end

   // attempt 4 (switch the order of attempt 1)
   always_ff @(posedge clk)
   begin            // ab4$_{entry}$ = ab4; q4$_{entry}$ = q4;
      q4 <= ab4;    // q4$_{deferred}$ = ab4$_{entry}$
      ab4 <= a & b; // ab4$_{deferred}$ = a & b
   end              // ab4 = ab4$_{deferred}$; q4 = q4$_{deferred}$

   // attempt 5 (switch the order of attempt 2)
   always_ff @(posedge clk)
   begin
      q5 = ab5;
      ab5 = a & b;
   end
endmodule
