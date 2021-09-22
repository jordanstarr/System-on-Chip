`timescale 1ns / 1ps

module state_machine(
    input logic clk, 
    input logic rst, 
    input logic btnc, 
    input logic btnu, 
    input logic btnr, 
    
    output logic [15:0] decoder_in, 
    output logic LED,
    output logic LED1
    );
    
    logic btnc_db; 
    logic btnu_db; 
    logic btnr_db;
    
    logic [15:0] stop_time; 
    logic [15:0] bin_to_dec; 
    
    logic timer_reset; 
    logic [15:0] ms_timer; 
    
    logic [15:0] random_num;  
    
    // Eric told me to use ENUM's to make the code easier, giving him credit here 
    typedef enum logic [2:0] {initialize, wait_rand, ontime, late, early, test} state_machine; 
    state_machine current_state; 
    state_machine next_state; 
    
    db_fsm db1( 
        .clk(clk), 
        .reset(rst), 
        .sw(btnc), 
        .db(btnc_db)
        );
        
    db_fsm db2( 
        .clk(clk), 
        .reset(rst), 
        .sw(btnu), 
        .db(btnu_db)
        );
        
    db_fsm db3( 
        .clk(clk), 
        .reset(rst), 
        .sw(btnr), 
        .db(btnr_db)
        );
        
     timer myTimer ( 
        .clk(clk), 
        .rst(timer_reset), 
        .ms_ticks(ms_timer)
        ); 
        
        
    Bin_to_dec_conv myConv( 
        .bin_val(ms_timer), 
        .thousands(bin_to_dec[15:12]), 
        .hundreds(bin_to_dec[11:8]), 
        .tens(bin_to_dec[7:4]), 
        .ones(bin_to_dec[3:0])
        );
        
    random_num_generator #(.N(25), .M(16)) myRand (
        .clk(clk), 
        .rst(rst), 
        .rand_num(random_num)
        ); 
        
    always_ff @ (posedge clk, posedge rst)
        if (rst)
            current_state <= initialize; 
        else
            current_state <= next_state; 
        
    always_comb @(posedge clk) begin 
        case(current_state) 
            initialize: begin 
                // say hi and do nothing else, waiting for input 
                decoder_in = 16'b1111111110101011; 
                LED = 0; 
                if (btnu_db) begin 
                    next_state = wait_rand; 
                    //random_num = 16'b0000011111010000;
                    timer_reset = 1;
                end
            end
            wait_rand: begin 
                // incrementing ms to the random value and waiting until that time
                timer_reset = 0; 
                decoder_in = 16'b1111111111111111;
                if (ms_timer == random_num) begin 
                    LED = 1; 
                    next_state = test; 
                    timer_reset = 1; 
                end
                else if (btnr_db) begin 
                    next_state = early; 
                end
            end 
            test: begin 
                // turn LED on and count up in ms on screen
                timer_reset = 0; 
                decoder_in = bin_to_dec;
                if (ms_timer == 1000) begin 
                    next_state = late; 
                end
                else if (btnr_db) begin 
                    next_state = ontime; 
                    stop_time = bin_to_dec; 
                end
//                else if (btnc_db) begin 
//                    next_state = initialize; 
//                end
            end
            ontime: begin 
                // display the time at which the button was pressed
                decoder_in = stop_time; 
                LED = 0; 
                if (btnc_db) begin 
                    next_state = initialize; 
                end
            end 
            late: begin 
                // display 1000 and stop time
                decoder_in = 16'b0001000000000000;
                LED = 0; 
                if (btnc_db) begin 
                    next_state = initialize; 
                end
            end 
            early: begin 
                // display 9999 because the button was pressed before wait was over
                decoder_in = 16'b1001100110011001; 
                LED = 0;
                if (btnc_db) begin 
                    next_state = initialize; 
                    end
                end
            endcase    
        end
    
    //assign state = next_state; 
    
endmodule
