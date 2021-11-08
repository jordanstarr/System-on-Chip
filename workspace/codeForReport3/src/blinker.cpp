// Jordan Cook
// November 1, 2021

#include "blinker.h"

BlinkerCore::BlinkerCore(uint32_t core_base_addr) {
   base_addr = core_base_addr;
   wr_data = 0;
}
BlinkerCore::~BlinkerCore() {
}

void BlinkerCore::write_reg0(uint32_t data) {
   wr_data = data;
   io_write(base_addr, DATA_REG0, wr_data);
}

void BlinkerCore::write_reg1(uint32_t data) {
   wr_data = data;
   io_write(base_addr, DATA_REG1, wr_data);
}

void BlinkerCore::write_reg2(uint32_t data) {
   wr_data = data;
   io_write(base_addr, DATA_REG2, wr_data);
}

void BlinkerCore::write_reg3(uint32_t data) {
   wr_data = data;
   io_write(base_addr, DATA_REG3, wr_data);
}
