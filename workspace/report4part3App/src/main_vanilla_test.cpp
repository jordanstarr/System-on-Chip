/*****************************************************************//**
 * @file main_vanilla_test.cpp
 *
 * @brief Basic test of 4 basic i/o cores
 *
 * @author p chu
 * @version v1.0: initial release
 *********************************************************************/

//#define _DEBUG
#include "chu_init.h"
#include "gpio_cores.h"

/**
 * blink once per second for 5 times.
 * provide a sanity check for timer (based on SYS_CLK_FREQ)
 * @param led_p pointer to led instance
 */
void timer_check(GpoCore *led_p) {
   int i;

   for (i = 0; i < 5; i++) {
      led_p->write(0xffff);
      sleep_ms(500);
      led_p->write(0x0000);
      sleep_ms(500);
      debug("timer check - (loop #)/now: ", i, now_ms());
   }
}

/**
 * check individual led
 * @param led_p pointer to led instance
 * @param n number of led
 */
void led_check(GpoCore *led_p, int n) {
   int i;

   for (i = 0; i < n; i++) {
      led_p->write(1, i);
      sleep_ms(200);
      led_p->write(0, i);
      sleep_ms(200);
   }
}

/**
 * leds flash according to switch positions.
 * @param led_p pointer to led instance
 * @param sw_p pointer to switch instance
 */
void sw_check(GpoCore *led_p, GpiCore *sw_p) {
   int i, s;

   s = sw_p->read();
   for (i = 0; i < 30; i++) {
      led_p->write(s);
      sleep_ms(50);
      led_p->write(0);
      sleep_ms(50);
   }
}

/**
 * uart transmits test line.
 * @note uart instance is declared as global variable in chu_io_basic.h
 */
void uart_check() {
   static int loop = 0;

   uart.disp("uart test #");
   uart.disp(loop);
   uart.disp("\n\r");
   loop++;
}

// instantiate switch, led
//GpoCore led(get_slot_addr(BRIDGE_BASE, S2_LED));
//GpiCore sw(get_slot_addr(BRIDGE_BASE, S3_SW));

// Chu's RGB switcher
PwmCore pwm(get_slot_addr(BRIDGE_BASE, S6_PWM));

void pwm_3color_led_check(PwmCore *pwm_p) {
   int i, n;
   double bright, duty;
   const double P20 = 1.2589;  // P20=100^(1/20); i.e., P20^20=100

   pwm_p->set_freq(50);
   for (n = 0; n < 3; n++) {
      bright = 1.0;
      for (i = 0; i < 20; i++) {
         bright = bright * P20;
         duty = bright / 100.0;
         pwm_p->set_duty(duty, n);
         pwm_p->set_duty(duty, n + 3);
         sleep_ms(100);
      }
      sleep_ms(300);
      pwm_p->set_duty(0.0, n);
      pwm_p->set_duty(0.0, n + 3);
   }
}

// Stuff I have written

PwmCore myPwm(get_slot_addr(BRIDGE_BASE, S6_PWM));
GpiCore mySwitch(get_slot_addr(BRIDGE_BASE, S3_SW));

int getSwitches(GpiCore *sw_pointer) {

	int switch1;
	int switch2;
	double sum;

	switch1 = sw_pointer -> read(0);
	switch2 = sw_pointer -> read(1);

	if (switch1 && switch2) {
		sum = 1.0;
	}
	else if (!switch1 && switch2) {
		sum = 0.75;
	}
	else if (switch1 && !switch2) {
			sum = 0.50;
		}
	else {
			sum = 0.25;
		}

	return sum;
}

void rainbowLED(PwmCore *pwm, GpiCore *sw_pointer) {

	double bright = 1.0;
	double duty;
	double P = 1.2589;

	const int length = 6 * 20;

	int red = 0;
	int green = 1;
	int blue = 2;

	pwm -> set_freq(50);

	for (int i = 0; i < length; i++) {

		double percent;
		int switch1;
		int switch2;
		switch1 = sw_pointer -> read(0);
		switch2 = sw_pointer -> read(1);

		if (switch1 && switch2) {
			percent = 1.0;
		}
		else if (!switch1 && switch2) {
			percent = 0.65;
		}
		else if (switch1 && !switch2) {
			percent = 0.3;
		}
		else {
			percent = 0.05;
		}

		if (i <=20) {
			bright = bright * P;
	        duty = bright / 100.0;

	        pwm -> set_duty(1.0 * percent, red);
	        pwm -> set_duty(1.0 * percent, red + 3);

	        pwm -> set_duty(duty * percent, green);
	        pwm -> set_duty(duty * percent, green + 3);

	        pwm -> set_duty(0, blue);
	        pwm -> set_duty(0, blue + 3);

	        sleep_ms(100);
		}
	    else if (i > 20 && i <= 40) {
	    	bright = bright / P;
	    	duty = bright / 100.0;

	    	pwm -> set_duty(duty * percent, red);
	    	pwm -> set_duty(duty * percent, red + 3);

	    	pwm -> set_duty(1.0 * percent, green);
	    	pwm -> set_duty(1.0 * percent, green + 3);

	    	pwm -> set_duty(0, blue);
	    	pwm -> set_duty(0, blue + 3);

	    	sleep_ms(100);
	    }
	    else if (i > 40 && i <= 60) {
	    	bright = bright * P;
	    	duty = bright / 100.0;

	    	pwm -> set_duty(0, red);
	    	pwm -> set_duty(0, red + 3);

	    	pwm -> set_duty(1.0 * percent, green);
	    	pwm -> set_duty(1.0 * percent, green + 3);

	    	pwm -> set_duty(duty * percent, blue);
	    	pwm -> set_duty(duty * percent, blue + 3);

	    	sleep_ms(100);
	    }
	    else if (i > 60 && i <= 80) {
	    	bright = bright / P;
	    	duty = bright / 100.0;

	    	pwm -> set_duty(0, red);
	    	pwm -> set_duty(0, red + 3);

	    	pwm -> set_duty(duty * percent, green);
	    	pwm -> set_duty(duty * percent, green + 3);

	    	pwm -> set_duty(1.0 * percent, blue);
	    	pwm -> set_duty(1.0 * percent, blue + 3);

	    	sleep_ms(100);
	    }
	    else if (i > 80 && i <= 100) {
	    	bright = bright * P;
	    	duty = bright / 100.0;

	    	pwm -> set_duty(duty * percent, red);
	    	pwm -> set_duty(duty * percent, red + 3);

	    	pwm -> set_duty(0, green);
	    	pwm -> set_duty(0, green + 3);

	    	pwm -> set_duty(1.0 * percent, blue);
	    	pwm -> set_duty(1.0 * percent, blue + 3);

	    	sleep_ms(100);
	    }
	    else if (i > 100 && i <= 120) {
	    	bright = bright / P;
	    	duty = bright / 100.0;

	    	pwm -> set_duty(1.0 * percent, red);
	    	pwm -> set_duty(1.0 * percent, red + 3);

	    	pwm -> set_duty(0, green);
	    	pwm -> set_duty(0, green + 3);

	    	pwm -> set_duty(duty * percent, blue);
	    	pwm -> set_duty(duty * percent, blue + 3);

	    	sleep_ms(100);
	    }
	}
}

int main() {

   while (1) {
//      timer_check(&led);
//      led_check(&led, 16);
//      sw_check(&led, &sw);
//      uart_check();
//      debug("main - switch value / up time : ", sw.read(), now_ms());

	   rainbowLED(&pwm, &mySwitch);

   } //while
} //main

