onbreak {quit -f}
onerror {quit -f}

vsim -voptargs="+acc" -t 1ps -L xil_defaultlib -L xpm -L microblaze_v10_0_3 -L lib_cdc_v1_0_2 -L proc_sys_reset_v5_0_11 -L lmb_v10_v3_0_9 -L lmb_bram_if_cntlr_v4_0_12 -L blk_mem_gen_v8_3_6 -L iomodule_v3_1_1 -L unisims_ver -L unimacro_ver -L secureip -lib xil_defaultlib xil_defaultlib. xil_defaultlib.glbl

do {wave.do}

view wave
view structure
view signals

do {.udo}

run -all

quit -force
