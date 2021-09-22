// $DISCLAIMER$

// $Id$

/*****************************************************************//**
 * @file ps2_core.h
 *
 * @brief Access MMIO ps2 core.
 *
 * Detailed description:
 * -
 *
 * $Author$
 * $Date$
 * $Revision$
 *********************************************************************/

#ifndef _PS2_H_INCLUDED
#define _PS2_H_INCLUDED

#include "chu_init.h"

/************************************************************************
 * Register map
 ************************************************************************
 * Read (data to cpu):
 *   offset 0
 *     * bit 7-0: 8-bit ps2 packet
 *   offset 1
 *     * bit 0: ps2 receiving fifo empty
 *     * bit 1: ps2 transmitter idle
 * Write (data from cpu):
 *   offset 0:  dummy data, used to generate an enable pulse
 *   offset 2:
 *     * bit 7-0: 8-bit ps2 command data
 *
 ***********************************************************************/

class Ps2Core {
public:
  /**
   * Register map
   *
   */
   enum {
      RD_DATA_REG = 0, /**< 8-bit read data register */
      PS2_WR_DATA_REG = 2, /**< 8-bit write data register */
      RM_RD_DATA_REG = 3  // remove read data
   };

  /**
   * Field masks
   *
   */
   enum {
      TX_IDLE_FIELD = 0x00000200, /**< bit 9 of rd_data_reg; full bit  */
      RX_EMPT_FIELD = 0x00000100, /**< bit 10 of rd_data_reg; empty bit */
      RX_DATA_FIELD = 0x000000ff  /**< bits of 7..0 rd_data_reg; read data */
   };
  /* methods */
  /**
   * Constructor.
   @note set default baud rate to 9600
   *
   */

   Ps2Core(uint32_t core_base_addr);
   ~Ps2Core();       // not used

   /**
    * check whether the ps2 receiver fifo is empty
    *
    * @return 1: if empty; 0: otherwise
    *
    */
   int rx_fifo_empty();

   /**
    * check whether the ps2 transmitter is idle
    *
    * @return 1: if idle; 0: otherwise
    *
    */
   int tx_idle();

   /**
    * send an 8-bit command to ps2
    *
    * @param cmd 8-bit command
    *
    */
   void tx_byte(uint8_t cmd);

   /**
    * check ps2 fifo and, if not empty, read data and then remove it
    *
    * @return  -1 if fifo is empty; fifo data otherwise
    *
    */
   int rx_byte();

   /**
    * reset and identify the type of ps2 device (mouse or keyboard).
    *
    * @return device id or error code as follows:
    *   1: keyboard;
    *   2: mouse (set to stream mode);
    *  -1: no response;
    *  -2: unknown device;
    *  -3: failure to set mouse to stream mode;
    *
    * @note keyboard does not require initialization; init() checks device id
    */
   int init();

   /**
    * get mouse activity
    *
    * @return 0: no new data; 1: with eww data
    * @return lbtn return 1 when left mouse button pressed;
    * @return rbtn return 1 when right mouse button pressed;
    * @return xmov return x-axis movement;
    * @return ymov return y-axis movement;
    *
    */
   int get_mouse_activity(int *lbtn, int *rbtn, int *xmov, int *ymov);


   /**
    * get keyboard activity
    *
    * @return 0: no new data; 1: with new data
    * @return ch return ASCII code of the pressed key
    *
    * @note special codes returned for non-ASCII keys (F1, ESC etc.)
    */
   int get_kb_ch(char *ch);

private:
   /* variable to keep track of current status */
   uint32_t base_addr;
};

#endif  // _PS2_H_INCLUDED
