// $DISCLAIMER$

/*****************************************************************//**
 * @file adsr_core.h
 *
 * @brief Configure and control MMIO adsr core
 *
 * Detailed description:
 * -
 *
 * @author: p chu
 * $Date$
 * $Revision$
 *********************************************************************/

#ifndef _ADSR_H_INCLUDED
#define _ADSR_H_INCLUDED

#include "chu_init.h"
#include "ddfs_core.h"

/**
 * adsr core driver:
 *  - configure and control MMIO adsr core.
 *  - play a music note
 *  - an MMIO adsr core must be physically connected to a ddfs core in hardware.
 */
class AdsrCore {
public:
   /**
    * Register map
    *
    */
   enum {
      START_REG = 0,     /**< start register */
      ATK_REG = 1,       /**< attack time register */
      DCY_REG = 2,       /**< decay time register */
      SUS_REG = 3,       /**< sustain time register */
      REL_REG = 4,       /**< release time register */
      SUS_LEVEL_REG = 5  /**< sustain level register */
   };
   /**
    * Symbolic constant
    *
    */
   enum {
      MAX = 0x7fffffff,  /**< absolute max amplitude level (2^31) */
      BYPASS_PATTERN = 0xffffffff, /**< amplitude pattern to bypass adsr   */
      STOP_PATTERN = 0   /**< amplitude pattern to silent sound  */
   };
   /* methods */
   /**
    * Constructor.
    *
    * @note An  core must used in conjunction with a ddfs core.
    * @note Constructor call init() to configure the ddfs core.
    */
   AdsrCore(uint32_t adsr_base_addr, DdfsCore *ddfs);
   ~AdsrCore();                  // not used

   /**
    * configure the MMIO ddfs core to be used with adsr core
    *
    */
   void init();

   /**
    * check whether the adsr is idle
    * (i.e., no envelope generation is in progress)
    *
    */
   int idle();

   /**
    * trigger to generate a new envelope
    *
    */
   void start();

   /**
    * set the envelope to 0
    *
    * @note Aborting turns off the volume but adsr controller still progresses;
    * issue another start() command to start a new envelope
    */
   void abort();

   /**
    * bypass the adsr generator by setting the envelope to 1.0
    *
    */
   void bypass();

   /**
    * wait for ddfs amplitude crossing 0
    *
    * @note can be used to ensure that a complete period is generated
    *       when reconfiguring ddfs.
    *
    */
   void wait_pcm_0_crossing();

   /**
    * set adsr envelope parameters
    *
    * @param attack_ms attack time in ms (0 for stop, 0xffffffff for bypass)
    * @param decay_ms decay time in ms (must be larger than 0)
    * @param sustain_ms sustain time in ms
    * @param release_ms release time in ms (must be larger than 0)
    * @param sus_level sustain level (0.0 to 1.0 of max value)
    *
    */
   void set_env(int attack_ms, int decay_ms, int sustain_ms, int release_ms, float sus_level);

   /**
    * select a predefined envelope
    *
    * @param n the number of a predefined envelope
    *
    */
   void select_env(int n);


   /**
    * calculate frequency of a music note
    *
    * @param oct octave #
    * @param ni note (0 to 11 for C, C#, D, ..., B)
    *
    * @return frequency of the note
    */
   int calc_note_freq(int oct, int ni);

   /**
    * play a music note for dur millisecond
    *
    * @param oct octave #
    * @param note music note (0 to 11 for C, C#, D, ..., B)
    * @param dur duration of a note in ms
    *
    * @note dur determines the length of sustain segment;
    *       sus = dur - (ams + dms + rms);
    */
   void play_note(int note, int oct, int dur);

private:
   /* variable to keep track of current status */
   uint32_t base_addr;
   /* current envelope parameters  */
   int ams, dms, sms, rms;
   float slevel;
   /* DDFS instance */
   DdfsCore *_ddfs;
   /* method */
   void write_adsr_reg();
};
#endif  // _ADSR_H_INCLUDED


   /*
    * trigger to generate a new envelope of a specific duration
    *
    * @param dur duration in ms
     *
    * @note sustain time will be updated to match duration
    * @note the duration must be larger than the sum
    *       of attack time, decay time and release time
    *
    */
   //void start(int dur);

