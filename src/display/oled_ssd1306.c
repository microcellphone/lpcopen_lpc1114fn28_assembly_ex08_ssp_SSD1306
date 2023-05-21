//#include <my_ssp.h.org>
#include "oled_ssd1306.h"
#include "my_delay.h"
#include "gpio_11xx_2_asm.h"

extern void SSP0_Tx_Data_Request(uint8_t dat);

//===========write command=========================
void SSD1306_SendCommand(uint8_t command)
{
  SSD1306_CS_CLR();		/* CS=L		     */
  SSD1306_DC_CLR();		/* DC=L		     */
  SSP0_Tx_Data_Request(command);
  SSD1306_CS_SET();
}

//===========write data=================================
void SSD1306_SendData(uint8_t date)
{
  SSD1306_CS_CLR();		/* CS=L		     */
  SSD1306_DC_SET();		/* DC=H		     */
  SSP0_Tx_Data_Request(date);
  SSD1306_CS_SET();		/* CS=H		     */
}

//===============================================
void OLED_Initialyze(void)
{
	SSD1306_CS_SET();		/* CS=H		*/
 	SSD1306_CS_CLR();		/* CS=L		*/
 	SSD1306_RES_CLR();	/* RES=L	*/
 	Delay(20);
 	SSD1306_RES_SET();	/* RES=H	*/
 	Delay(50);

	SSD1306_SendCommand(0xAE);     //Set Display Off
	SSD1306_SendCommand(0xd5);     //display divide ratio/osc. freq. mode
	SSD1306_SendCommand(0x80);     //
	SSD1306_SendCommand(0xA8);     //multiplex ration mode:63
	SSD1306_SendCommand(0x3F);
	SSD1306_SendCommand(0xD3);     //Set Display Offset
	SSD1306_SendCommand(0x00);
	SSD1306_SendCommand(0x40);     //Set Display Start Line
	SSD1306_SendCommand(0x8D);     //Set Display Offset
	// SSD1306_SendCommand(0x10);
	SSD1306_SendCommand(0x14);
	SSD1306_SendCommand(0xA1);     //Segment Remap
	SSD1306_SendCommand(0xC8);     //Sst COM Output Scan Direction
	//SSD1306_SendCommand(0xC8);
	SSD1306_SendCommand(0xDA);     //common pads hardware: alternative
	SSD1306_SendCommand(0x12);
	SSD1306_SendCommand(0x81);     //contrast control
	//SSD1306_SendCommand(0x9F);     //
	SSD1306_SendCommand(0x66);
	SSD1306_SendCommand(0xD9);	   //set pre-charge period
	//SSD1306_SendCommand(0x22);	    //set period 1:1;period 2:15
	SSD1306_SendCommand(0xF1);
	SSD1306_SendCommand(0xDB);     //VCOM deselect level mode
	SSD1306_SendCommand(0x40);	   //set Vvcomh=0.83*Vcc
	SSD1306_SendCommand(0xA4);     //Set Entire Display On/Off
	SSD1306_SendCommand(0xA6);     //Set Normal Display
	SSD1306_SendCommand(0xAF);     //Set Display On
}

void OLED_Clear_Screen (uint8_t state)
{
  uint8_t page,column;

  for(page=0;page<8;page++) {
    SSD1306_SendCommand(0xb0+page);
    SSD1306_SendCommand(0x10);
    SSD1306_SendCommand(0x00);
    for(column=0;column<OLED_X_MAX+1;column++) {
      SSD1306_SendData(state);
    }
  }
}
