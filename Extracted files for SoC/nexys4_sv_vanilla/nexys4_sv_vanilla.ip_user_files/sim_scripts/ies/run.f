-makelib ies/xil_defaultlib -sv \
  "C:/Xilinx/Vivado/2017.2/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies/xpm \
  "C:/Xilinx/Vivado/2017.2/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies/microblaze_v10_0_3 \
  "../../ipstatic/hdl/microblaze_v10_0_vh_rfs.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/sys/mcs_v2017/bd_0/ip/ip_0/sim/bd_3914_microblaze_I_0.vhd" \
-endlib
-makelib ies/lib_cdc_v1_0_2 \
  "../../ipstatic/hdl/lib_cdc_v1_0_rfs.vhd" \
-endlib
-makelib ies/proc_sys_reset_v5_0_11 \
  "../../ipstatic/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/sys/mcs_v2017/bd_0/ip/ip_1/sim/bd_3914_rst_0_0.vhd" \
-endlib
-makelib ies/lmb_v10_v3_0_9 \
  "../../ipstatic/hdl/lmb_v10_v3_0_vh_rfs.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/sys/mcs_v2017/bd_0/ip/ip_2/sim/bd_3914_ilmb_0.vhd" \
  "C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/sys/mcs_v2017/bd_0/ip/ip_3/sim/bd_3914_dlmb_0.vhd" \
-endlib
-makelib ies/lmb_bram_if_cntlr_v4_0_12 \
  "../../ipstatic/hdl/lmb_bram_if_cntlr_v4_0_vh_rfs.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/sys/mcs_v2017/bd_0/ip/ip_4/sim/bd_3914_dlmb_cntlr_0.vhd" \
  "C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/sys/mcs_v2017/bd_0/ip/ip_5/sim/bd_3914_ilmb_cntlr_0.vhd" \
-endlib
-makelib ies/blk_mem_gen_v8_3_6 \
  "../../ipstatic/simulation/blk_mem_gen_v8_3.v" \
-endlib
-makelib ies/xil_defaultlib \
  "C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/sys/mcs_v2017/bd_0/ip/ip_6/sim/bd_3914_lmb_bram_I_0.v" \
-endlib
-makelib ies/iomodule_v3_1_1 \
  "../../ipstatic/hdl/iomodule_v3_1_vh_rfs.vhd" \
-endlib
-makelib ies/xil_defaultlib \
  "C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/sys/mcs_v2017/bd_0/ip/ip_7/sim/bd_3914_iomodule_0_0.vhd" \
  "C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/sys/mcs_v2017/bd_0/hdl/bd_3914.vhd" \
  "C:/Users/pongchu/Google Drive/code_listing_sv/fpga_mcs_sv_src/hdl/sys/mcs_v2017/sim/cpu.vhd" \
-endlib
-makelib ies/xil_defaultlib -sv \
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
-endlib
-makelib ies/xil_defaultlib \
  glbl.v
-endlib

