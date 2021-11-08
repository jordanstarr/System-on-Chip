// Jordan Cook
// November 1

#include "chu_init.h"

class BlinkerCore {
public:
   enum {
      DATA_REG0 = 0, /**< output data register */
	  DATA_REG1 = 1,
	  DATA_REG2 = 2,
	  DATA_REG3 = 3
   };
   /**
    * constructor.
    *
    */
   BlinkerCore(uint32_t core_base_addr);
   ~BlinkerCore();                  // not used

   /**
    * write a 32-bit word
    * @param data 32-bit data
    *
    */
   void write(uint32_t data);

   void write_reg0(uint32_t data);
   void write_reg1(uint32_t data);
   void write_reg2(uint32_t data);
   void write_reg3(uint32_t data);

private:
   uint32_t base_addr;
   uint32_t wr_data;      // same as GPO core data reg
};
