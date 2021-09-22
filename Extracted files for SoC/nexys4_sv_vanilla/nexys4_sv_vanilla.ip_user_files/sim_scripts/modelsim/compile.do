vlib work
vlib msim

vlib msim/xil_defaultlib
vlib msim/xpm
vlib msim/microblaze_v10_0_3
vlib msim/lib_cdc_v1_0_2
vlib msim/proc_sys_reset_v5_0_11
vlib msim/lmb_v10_v3_0_9
vlib msim/lmb_bram_if_cntlr_v4_0_12
vlib msim/blk_mem_gen_v8_3_6
vlib msim/iomodule_v3_1_1

vmap xil_defaultlib msim/xil_defaultlib
vmap xpm msim/xpm
vmap microblaze_v10_0_3 msim/microblaze_v10_0_3
vmap lib_cdc_v1_0_2 msim/lib_cdc_v1_0_2
vmap proc_sys_reset_v5_0_11 msim/proc_sys_reset_v5_0_11
vmap lmb_v10_v3_0_9 msim/lmb_v10_v3_0_9
vmap lmb_bram_if_cntlr_v4_0_12 msim/lmb_bram_if_cntlr_v4_0_12
vmap blk_mem_gen_v8_3_6 msim/blk_mem_gen_v8_3_6
vmap iomodule_v3_1_1 msim/iomodule_v3_1_1

vlog -work xil_defaultlib -64 -incr -sv -L xil_defaultlib "+incdir+C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/sys/bridge" "+incdir+C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/sys/bridge" \
"C:/Xilinx/Vivado/2017.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"C:/Xilinx/Vivado/2017.2/data/ip/xpm/xpm_VCOMP.vhd" \

vcom -work microblaze_v10_0_3 -64 -93 \
"../../ipstatic/hdl/microblaze_v10_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/sys/mcs_v2017/bd_0/ip/ip_0/sim/bd_3914_microblaze_I_0.vhd" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../ipstatic/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work proc_sys_reset_v5_0_11 -64 -93 \
"../../ipstatic/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/sys/mcs_v2017/bd_0/ip/ip_1/sim/bd_3914_rst_0_0.vhd" \

vcom -work lmb_v10_v3_0_9 -64 -93 \
"../../ipstatic/hdl/lmb_v10_v3_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/sys/mcs_v2017/bd_0/ip/ip_2/sim/bd_3914_ilmb_0.vhd" \
"C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/sys/mcs_v2017/bd_0/ip/ip_3/sim/bd_3914_dlmb_0.vhd" \

vcom -work lmb_bram_if_cntlr_v4_0_12 -64 -93 \
"../../ipstatic/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/sys/mcs_v2017/bd_0/ip/ip_4/sim/bd_3914_dlmb_cntlr_0.vhd" \
"C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/sys/mcs_v2017/bd_0/ip/ip_5/sim/bd_3914_ilmb_cntlr_0.vhd" \

vlog -work blk_mem_gen_v8_3_6 -64 -incr "+incdir+C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/sys/bridge" "+incdir+C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/sys/bridge" \
"../../ipstatic/simulation/blk_mem_gen_v8_3.v" \

vlog -work xil_defaultlib -64 -incr "+incdir+C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/sys/bridge" "+incdir+C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/sys/bridge" \
"C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/sys/mcs_v2017/bd_0/ip/ip_6/sim/bd_3914_lmb_bram_I_0.v" \

vcom -work iomodule_v3_1_1 -64 -93 \
"../../ipstatic/hdl/iomodule_v3_1_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/sys/mcs_v2017/bd_0/ip/ip_7/sim/bd_3914_iomodule_0_0.vhd" \
"C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/sys/mcs_v2017/bd_0/hdl/bd_3914.vhd" \
"C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/sys/mcs_v2017/sim/cpu.vhd" \

vlog -work xil_defaultlib -64 -incr -sv -L xil_defaultlib "+incdir+C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/sys/bridge" "+incdir+C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/sys/bridge" \
"C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/mmio/uart/baud_gen.sv" \
"C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/mmio/mmio_basic/chu_gpi.sv" \
"C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/mmio/mmio_basic/chu_gpo.sv" \
"C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/sys/bridge/chu_mcs_bridge.sv" \
"C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/mmio/mmio_support/chu_mmio_controller.sv" \
"C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/mmio/mmio_basic/chu_timer.sv" \
"C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/mmio/uart/chu_uart.sv" \
"C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/mmio/mmio_support/fifo/fifo.sv" \
"C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/mmio/mmio_support/fifo/fifo_ctrl.sv" \
"C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/sys/top/mcs_top_vanilla.sv" \
"C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/sys/subsys/mmio_sys_vanilla.sv" \
"C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/mmio/mmio_support/fifo/reg_file.sv" \
"C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/mmio/uart/uart.sv" \
"C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/mmio/uart/uart_rx.sv" \
"C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/mmio/uart/uart_tx.sv" \

vlog -work xil_defaultlib \
"glbl.v"

