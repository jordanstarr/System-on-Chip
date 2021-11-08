`include "chu_io_map.svh"
module mmio_sys_vanilla 
#(
   parameter N_SW = 8,
   parameter N_LED = 8
)	
(
   input logic clk,
   input  logic reset,
   // FPro bus 
   input  logic mmio_cs,
   input  logic mmio_wr,
   input  logic mmio_rd,
   input  logic [20:0] mmio_addr, // 11 LSB used; 2^6 slots; 2^5 reg each 
   input  logic [31:0] mmio_wr_data,
   output logic [31:0] mmio_rd_data,
   // switches and LEDs
   input logic [N_SW-1:0] sw,
   output logic [N_LED-1:0] led,
   output logic [3:0] myLED, 
   // uart
   input logic rx,
   output logic tx          
);

   // declaration
   logic [63:0] mem_rd_array;
   logic [63:0] mem_wr_array;
   logic [63:0] cs_array;
   logic [4:0] reg_addr_array [63:0];
   logic [31:0] rd_data_array [63:0]; 
   logic [31:0] wr_data_array [63:0];

   // body
   // instantiate mmio controller 
   chu_mmio_controller ctrl_unit
   (.clk(clk),
    .reset(reset),
    .mmio_cs(mmio_cs),
    .mmio_wr(mmio_wr),
    .mmio_rd(mmio_rd),
    .mmio_addr(mmio_addr), 
    .mmio_wr_data(mmio_wr_data),
    .mmio_rd_data(mmio_rd_data),
    // slot interface
    .slot_cs_array(cs_array),
    .slot_mem_rd_array(mem_rd_array),
    .slot_mem_wr_array(mem_wr_array),
    .slot_reg_addr_array(reg_addr_array),
    .slot_rd_data_array(rd_data_array), 
    .slot_wr_data_array(wr_data_array)
    );
  
   // slot 0: system timer 
   chu_timer timer_slot0 
   (.clk(clk),
    .reset(reset),
    .cs(cs_array[`S0_SYS_TIMER]),
    .read(mem_rd_array[`S0_SYS_TIMER]),
    .write(mem_wr_array[`S0_SYS_TIMER]),
    .addr(reg_addr_array[`S0_SYS_TIMER]),
    .rd_data(rd_data_array[`S0_SYS_TIMER]),
    .wr_data(wr_data_array[`S0_SYS_TIMER])
    );

   // slot 1: UART 
   chu_uart uart_slot1 
   (.clk(clk),
    .reset(reset),
    .cs(cs_array[`S1_UART1]),
    .read(mem_rd_array[`S1_UART1]),
    .write(mem_wr_array[`S1_UART1]),
    .addr(reg_addr_array[`S1_UART1]),
    .rd_data(rd_data_array[`S1_UART1]),
    .wr_data(wr_data_array[`S1_UART1]), 
    .tx(tx),
    .rx(rx)
    );
   //assign rd_data_array[1] = 32'h00000000;

   // slot 2: gpo 
   chu_gpo #(.W(12)) gpo_slot2 
   (.clk(clk),
    .reset(reset),
    .cs(cs_array[`S2_LED]),
    .read(mem_rd_array[`S2_LED]),
    .write(mem_wr_array[`S2_LED]),
    .addr(reg_addr_array[`S2_LED]),
    .rd_data(rd_data_array[`S2_LED]),
    .wr_data(wr_data_array[`S2_LED]),
    .dout(led)
    );

   // slot 3: gpi 
   chu_gpi #(.W(N_SW)) gpi_slot3 
   (.clk(clk),
    .reset(reset),
    .cs(cs_array[`S3_SW]),
    .read(mem_rd_array[`S3_SW]),
    .write(mem_wr_array[`S3_SW]),
    .addr(reg_addr_array[`S3_SW]),
    .rd_data(rd_data_array[`S3_SW]),
    .wr_data(wr_data_array[`S3_SW]),
    .din(sw)
    );
    
    // slot 4: LED core 
    LED_core slot_4 
        (.clk(clk),
        .reset(reset),
        .cs(cs_array[`S4_USER]),
        .read(mem_rd_array[`S4_USER]),
        .write(mem_wr_array[`S4_USER]),
        .addr(reg_addr_array[`S4_USER]),
        .rd_data(rd_data_array[`S4_USER]),
        .wr_data(wr_data_array[`S4_USER]),
        .dout(myLED)
        );
    
   // assign 0's to all unused slot rd_data signals
   generate
      genvar i;
      for (i=4; i<64; i=i+1) begin:  unused_slot_gen
         assign rd_data_array[i] = 32'hffffffff;
      end
   endgenerate
endmodule