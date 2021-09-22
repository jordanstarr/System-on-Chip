//`timescale 1ns / 1ps

//module Bin_to_dec_conv(
//    input logic [15:0] bin_val,
    
//    output logic [3:0] thousands, 
//    output logic [3:0] hundreds,
//    output logic [3:0] tens,
//    output logic [3:0] ones
//    );
    
//    integer i;
    
//    always_comb begin 
//        thousands = 0; 
//        hundreds = 0; 
//        tens = 0; 
//        ones = 0; 
         
//        for (i = 15; i <= 0; i--) begin 
//            if (thousands >= 5) 
//                thousands = thousands + 3; 
//            if (hundreds >= 5) 
//                hundreds = hundreds + 3; 
//            if (tens >= 5) 
//                tens = tens + 3; 
//            if (ones >= 5) 
//                ones = ones + 3; 
                
//            thousands = thousands << 1; 
//            thousands[0] = hundreds[3]; 
            
//            hundreds = hundreds << 1; 
//            hundreds[0] = tens[3]; 
            
//            tens = tens << 1; 
//            tens[0] = ones[3]; 
            
//            ones = ones << 1; 
//            ones[0] = bin_val[i];
//        end 
//    end
    
//endmodule

// I couldn't find my original code from digital logic
// I tried to rewrite it 
// my binary to decimal converter had a bug in it that I couldn't find so I used Eric's code here
// you can see my original code above 
// if I have time, I will try to get that working 
// but since this isn't the focus of the lab, I put my time elsewhere
module Bin_to_dec_conv(
    input logic [15:0] bin_val,
    output logic [3:0] thousands,
    output logic [3:0] hundreds,
    output logic [3:0] tens,
    output logic [3:0] ones
    );
    
    integer i;
    always_comb
    begin
        thousands = 4'd0;
        hundreds = 4'd0;
        tens = 4'd0;
        ones = 4'd0;
        
        for(i=15; i>=0; i--)
        begin
        //Add 3 to those > 5, to convert base 16 to base 10 after shift (+6)
            if(thousands >= 5)
                thousands+=3;
            if(hundreds >= 5)
                hundreds+=3;
            if(tens >= 5)
                tens+=3;
            if(ones >= 5)
                ones+=3;
            //Shift Left
            thousands = thousands << 1;
            thousands[0] = hundreds[3];
            hundreds = hundreds << 1;
            hundreds [0] = tens[3];
            tens = tens << 1;
            tens[0] = ones[3];
            ones = ones << 1;
            ones[0] = bin_val[i];
        end
    end
endmodule
