#include <chip.h>
#include <my_ssp.h.org>
#include <string.h>
#include "gpio_11xx_2_asm.h"

#define OLED_X_MAX	128-1
#define OLED_Y_MAX	64-1
/* Display Control Macros */
#define SSD1306_CS_SET()	  	LPC_GPIO[0].DATA[(1 << 2)] = (1 << 2);
#define SSD1306_CS_CLR()	  	LPC_GPIO[0].DATA[(1 << 2)] = (0 << 2);
#define SSD1306_RES_SET()	LPC_GPIO[1].DATA[(1 << 5)] = (1 << 5);
#define SSD1306_RES_CLR()  	LPC_GPIO[1].DATA[(1 << 5)] = (0 << 5);
#define SSD1306_DC_SET()	  	LPC_GPIO[1].DATA[(1 << 4)] = (1 << 4);
#define SSD1306_DC_CLR()	  	LPC_GPIO[1].DATA[(1 << 4)] = (0 << 4);

//======================================
extern void OLED_Initialyze(void);
extern void SSD1306_SendCommand(uint8_t command);
extern void SSD1306_SendData(uint8_t date);
extern void OLED_Clear_Screen (uint8_t state);
//======================================
extern void SSP0_Send_Request(uint8_t dat);
extern void SSP0_Send_Request16(uint16_t dat);
