/*
===============================================================================
 Name        : lpcopen_lpc1114fn28_asm_ex08_ssp_SSD1306.c
 Author      : $(author)
 Version     :
 Copyright   : $(copyright)
 Description : main definition
===============================================================================
*/

#if defined (__USE_LPCOPEN)
#if defined(NO_BOARD_LIB)
#include "chip.h"
#else
#include "board.h"
#endif
#endif

#include <cr_section_macros.h>

// TODO: insert other include files here
#include "demo.h"
#include "oled_ssd1306.h"
#include "my_delay.h"
#include <my_ssp.h.org>

extern void SSP0_Config_Request(uint32_t bitlen, uint32_t bitrate, uint32_t spi_cs_type);

// TODO: insert other definitions and declarations here

int main(void) {

#if defined (__USE_LPCOPEN)
    // Read clock settings and update SystemCoreClock variable
    SystemCoreClockUpdate();
#if !defined(NO_BOARD_LIB)
    // Set up and initialize all required blocks and
    // functions related to the board hardware
    Board_Init();
    // Set the LED to the state of "On"
    Board_LED_Set(0, true);
#endif
#endif

    // TODO: insert code here
    SysTick_Config(SystemCoreClock/1000 - 1); /* Generate interrupt each 1 s   */
    SSP0_Config_Request(8, SPI_SLOW, SPI_GENERIC);
    OLED_Initialyze();
    OLED_Clear_Screen(0);

    // Force the counter to be placed into memory
    volatile static int i = 0 ;
    // Enter an infinite loop, just incrementing a counter
    while(1) {
     	 Delay(100);
     	//     	 demo_1();
     	//     	 demo_2();
     	 demo_3();
     	 demo_4();
     	 demo_5();
     	 demo_6();
     	//     	 demo_7();
     	//     	 demo_8();
        i++ ;
        // "Dummy" NOP to allow source level single
        // stepping of tight while() loop
        __asm volatile ("nop");
    }

    return 0 ;
}
