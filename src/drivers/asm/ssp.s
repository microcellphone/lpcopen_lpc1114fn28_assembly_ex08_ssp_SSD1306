/*
Here are some common GCC directives for ARM Cortex-M0 assembly:

.align: Specifies the byte alignment of the following instruction or data item.
.ascii: Specifies a string of characters to be included in the output file.
.asciz: Specifies a zero-terminated string of characters to be included in the output file.
.byte: Specifies one or more bytes of data to be included in the output file.
.data: Marks the start of a data section.
.global: Marks a symbol as visible outside of the current file.
.section: Specifies the section of memory where the following instructions or data items should be placed.
.space: Reserves a block of memory with a specified size.
.thumb: Instructs the assembler to generate Thumb code.
.thumb_func: Marks a function as using the Thumb instruction set.
.word: Specifies one or more words of data to be included in the output file.

Note that this is not an exhaustive list, and different versions of GCC may support additional or different directives.
*/

#include "my_ssp.h"
#include "ssp_11xx_asm.h"
#include "iocon_11xx_asm.h"
#include "sysctl_11xx_asm.h"
#include "gpio_11xx_2_asm.h"

    .syntax unified



	.cpu cortex-m0
	.text
	.section	.text.NVIC_EnableIRQ,"ax",%progbits
	.align	1
	.arch armv6s-m
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	NVIC_EnableIRQ, %function
NVIC_EnableIRQ:
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	adds	r3, r7, #7
	ldrb	r3, [r3]
	movs	r2, r3
	movs	r3, #31
	ands	r3, r2
	movs	r2, #1
	lsls	r2, r2, r3
	ldr	r3, .L2
	str	r2, [r3]
	nop
	mov	sp, r7
	add	sp, sp, #8
	pop	{r7, pc}
.L3:
	.align	2
.L2:
	.word	-536813312
.LFE24:
	.size	NVIC_EnableIRQ, .-NVIC_EnableIRQ


	.section	.text.NVIC_SetPriority,"ax",%progbits
	.align	1
	.syntax unified
	.code	16
	.thumb_func
	.fpu softvfp
	.type	NVIC_SetPriority, %function
NVIC_SetPriority:
	push	{r4, r7, lr}
	sub	sp, sp, #12
	add	r7, sp, #0
	movs	r2, r0
	str	r1, [r7]
	adds	r3, r7, #7
	strb	r2, [r3]
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #127
	bls	.L5
	ldr	r2, .L8
	adds	r3, r7, #7
	ldrb	r3, [r3]
	movs	r1, r3
	movs	r3, #15
	ands	r3, r1
	subs	r3, r3, #8
	lsrs	r3, r3, #2
	adds	r3, r3, #6
	lsls	r3, r3, #2
	adds	r3, r2, r3
	adds	r3, r3, #4
	ldr	r3, [r3]
	adds	r2, r7, #7
	ldrb	r2, [r2]
	movs	r1, r2
	movs	r2, #3
	ands	r2, r1
	lsls	r2, r2, #3
	movs	r1, #255
	lsls	r1, r1, r2
	movs	r2, r1
	mvns	r2, r2
	ands	r2, r3
	movs	r1, r2
	ldr	r3, [r7]
	lsls	r3, r3, #6
	movs	r2, #255
	ands	r2, r3
	adds	r3, r7, #7
	ldrb	r3, [r3]
	movs	r0, r3
	movs	r3, #3
	ands	r3, r0
	lsls	r3, r3, #3
	lsls	r2, r2, r3
	ldr	r0, .L8
	adds	r3, r7, #7
	ldrb	r3, [r3]
	movs	r4, r3
	movs	r3, #15
	ands	r3, r4
	subs	r3, r3, #8
	lsrs	r3, r3, #2
	orrs	r2, r1
	adds	r3, r3, #6
	lsls	r3, r3, #2
	adds	r3, r0, r3
	adds	r3, r3, #4
	str	r2, [r3]
	b	.L7
.L5:
	ldr	r2, .L8+4
	adds	r3, r7, #7
	ldrb	r3, [r3]
	sxtb	r3, r3
	lsrs	r3, r3, #2
	adds	r3, r3, #192
	lsls	r3, r3, #2
	ldr	r3, [r3, r2]
	adds	r2, r7, #7
	ldrb	r2, [r2]
	movs	r1, r2
	movs	r2, #3
	ands	r2, r1
	lsls	r2, r2, #3
	movs	r1, #255
	lsls	r1, r1, r2
	movs	r2, r1
	mvns	r2, r2
	ands	r2, r3
	movs	r1, r2
	ldr	r3, [r7]
	lsls	r3, r3, #6
	movs	r2, #255
	ands	r2, r3
	adds	r3, r7, #7
	ldrb	r3, [r3]
	movs	r0, r3
	movs	r3, #3
	ands	r3, r0
	lsls	r3, r3, #3
	lsls	r2, r2, r3
	ldr	r0, .L8+4
	adds	r3, r7, #7
	ldrb	r3, [r3]
	sxtb	r3, r3
	lsrs	r3, r3, #2
	orrs	r2, r1
	adds	r3, r3, #192
	lsls	r3, r3, #2
	str	r2, [r3, r0]
.L7:
	nop
	mov	sp, r7
	add	sp, sp, #12
	pop	{r4, r7, pc}
.L9:
	.align	2
.L8:
	.word	-536810240
	.word	-536813312
.LFE29:
	.size	NVIC_SetPriority, .-NVIC_SetPriority



    .text
    .global  SSP0_Config_Request
	.thumb
	.thumb_func
    .type	SSP0_Config_Request, %function
SSP0_Config_Request:
	push	{r7, lr}
	sub	sp, sp, #24
	add	r7, sp, #0
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
//    LPC_IOCON->REG[IOCON_PIO1_4] = 0x00000000; // GPIO, disable pu/pd mos
	ldr	r2, =LPC_IOCON_BASE
	movs	r3, #IOCON_OFFSET_PIO1_4
	movs	r1, #(IOCON_FUNC0|IOCON_MODE_INACT)
	str	r1, [r2, r3]
//    LPC_GPIO[1].DIR |= 1<<4;	// PIO1_4 out
	ldr	r2, =LPC_GPIO_PORT1_BASE
	ldr	r3, =GPIO_OFFSET_DIR
	ldr	r3, [r2, r3]
	ldr	r1, =LPC_GPIO_PORT1_BASE
	movs	r2, #(1<<4)
	orrs	r2, r3
	ldr	r3, =GPIO_OFFSET_DIR
	str	r2, [r1, r3]
//    LPC_GPIO[1].DATA[(1 << 4)] |=  (1 << 4); // high
	ldr	r3, =LPC_GPIO_PORT1_BASE
	ldr	r2, [r3, #64]
	ldr	r3, =LPC_GPIO_PORT1_BASE
	movs	r1, #(1 << 4)
	orrs	r2, r1
	str	r2, [r3, #64]
//    LPC_IOCON->REG[IOCON_PIO1_5] = 0x00000000; // GPIO, disable pu/pd mos
	ldr	r2, =LPC_IOCON_BASE
	movs	r3, #IOCON_OFFSET_PIO1_5
	movs	r1, #(IOCON_FUNC0|IOCON_MODE_INACT)
	str	r1, [r2, r3]
//    LPC_GPIO[1].DIR |= 1<<5;	// PIO1_5 out
	ldr	r2, =LPC_GPIO_PORT1_BASE
	ldr	r3, =GPIO_OFFSET_DIR
	ldr	r3, [r2, r3]
	ldr	r1, =LPC_GPIO_PORT1_BASE
	movs	r2, #(1<<5)
	orrs	r2, r3
	ldr	r3, =GPIO_OFFSET_DIR
	str	r2, [r1, r3]
//    LPC_GPIO[1].DATA[(1 << 5)] |=  (1 << 5);	// high
	ldr	r2, =LPC_GPIO_PORT1_BASE
	movs	r3, #128
	ldr	r3, [r2, r3]
	ldr	r1, =LPC_GPIO_PORT1_BASE
	movs	r2, #(1 << 5)
	orrs	r3, r2
	movs	r2, #128
	str	r3, [r1, r2]
//    LPC_IOCON->REG[IOCON_PIO0_2] = 0x00000000; // GPIO, disable pu/pd mos
	ldr	r3, =LPC_IOCON_BASE
	movs	r2, #(IOCON_FUNC0|IOCON_MODE_INACT)
	str	r2, [r3, #IOCON_OFFSET_PIO0_2]
//    LPC_GPIO[0].DIR |= 1<<2;	// PIO0_2 out
	ldr	r2, =LPC_GPIO_PORT0_BASE
	ldr	r3, =GPIO_OFFSET_DIR
	ldr	r3, [r2, r3]
	ldr	r2, =LPC_GPIO_PORT0_BASE
	movs	r1, #(1<<2)
	orrs	r1, r3
	ldr	r3, =GPIO_OFFSET_DIR
	str	r1, [r2, r3]
//    LPC_GPIO[0].DATA[(1 << 2)] |=  (1 << 2);	// high
	ldr	r3, =LPC_GPIO_PORT0_BASE
	ldr	r2, [r3, #16]
	ldr	r3, =LPC_GPIO_PORT0_BASE
	movs	r1, #(1 << 2)
	orrs	r2, r1
	str	r2, [r3, #16]
//    LPC_IOCON->REG[IOCON_PIO0_6] = IOCON_FUNC2;	// SCK is PIO0_6
	ldr	r3, =LPC_IOCON_BASE
	movs	r2, #(IOCON_FUNC2|IOCON_MODE_INACT)
	str	r2, [r3, #IOCON_OFFSET_PIO0_6]
//    LPC_IOCON->REG[IOCON_PIO0_9] = IOCON_FUNC1;	// MOSI, disable pu/pd mos
	ldr	r3, =LPC_IOCON_BASE
	movs	r2, #(IOCON_FUNC1|IOCON_MODE_INACT)
	str	r2, [r3, #IOCON_OFFSET_PIO0_9]
//    LPC_IOCON->REG[IOCON_PIO0_8] = IOCON_FUNC3;	// MISO, enable pu/pd mos
	ldr	r3, =LPC_IOCON_BASE
	movs	r2, #(IOCON_FUNC3|IOCON_MODE_INACT)
	str	r2, [r3, #IOCON_OFFSET_PIO0_8]
//    LPC_SYSCTL->PRESETCTRL    |= (0x1<<0);
	ldr	r3, =LPC_SYSCTL_BASE
	ldr	r2, [r3, #OFFSET_PRESETCTRL]
	ldr	r3, =LPC_SYSCTL_BASE
	movs	r1, #1
	orrs	r2, r1
	str	r2, [r3, #OFFSET_PRESETCTRL]
//    LPC_SYSCTL->SYSAHBCLKCTRL |= (1<<11);
	ldr	r2, =LPC_SYSCTL_BASE
	movs	r3, #OFFSET_SYSAHBCLKCTRL
	ldr	r3, [r2, r3]
	ldr	r1, =LPC_SYSCTL_BASE
	movs	r2, #128
	lsls	r2, r2, #4
	orrs	r3, r2
	movs	r2, #OFFSET_SYSAHBCLKCTRL
	str	r3, [r1, r2]
//    LPC_SYSCTL->SSP0CLKDIV     = 0x01; // Divided by 1
	ldr	r2, =LPC_SYSCTL_BASE
	movs	r3, #OFFSET_SSP0CLKDIV //148
	movs	r1, #1
	str	r1, [r2, r3]
//  if (speed == SPI_FAST){
	ldr	r3, [r7, #8]
	cmp	r3, #SPI_FAST
	bne	.L11  // SPI_SLOW
//    LPC_SSP0->CR0 = 0x0000 + (bitlen - 1);
	ldr	r3, =LPC_SSP0_BASE
	ldr	r2, [r7, #SSP_OFFSET_CR0]
	subs	r2, r2, #1
	str	r2, [r3]
//    LPC_SSP0->CPSR = 2;
	ldr	r3, =LPC_SSP0_BASE
	movs	r2, #2
	str	r2, [r3, #SSP_OFFSET_CPSR]
	b	.L12
.L11: // SPI_SLOW
//    LPC_SSP0->CR0 = 0x0300 + (bitlen - 1);
	ldr	r3, =LPC_SSP0_BASE
	ldr	r2, [r7, #12]
	ldr	r1, =767
	mov	ip, r1
	add	r2, r2, ip
	str	r2, [r3]
//    LPC_SSP0->CPSR = 30;
	ldr	r3, =LPC_SSP0_BASE
	movs	r2, #30
	str	r2, [r3, #16]
.L12:
	movs	r3, #0
	str	r3, [r7, #20]
	b	.L13
DUMMY_READ_WAIT:
//  for ( i = 0; i < SSP_FIFOSIZE; i++ ) Dummy = LPC_SSP0->DR;
	ldr	r3, =LPC_SSP0_BASE
	ldr	r3, [r3, #SSP_OFFSET_DR]
	str	r3, [r7, #16]
	ldr	r3, [r7, #20]
	adds	r3, r3, #1
	str	r3, [r7, #20]
.L13:
	ldr	r3, [r7, #20]
	cmp	r3, #7
	bls	DUMMY_READ_WAIT
//  NVIC_EnableIRQ(SSP0_IRQn);
	movs	r0, #20
	bl	NVIC_EnableIRQ
//  NVIC_SetPriority(SSP0_IRQn, 3);
	movs	r1, #3
	movs	r0, #20
	bl	NVIC_SetPriority
//  LPC_SSP0->CR1 = SSP_CR1_SSP_EN;
	ldr	r3, =LPC_SSP0_BASE
	movs	r2, #2
	str	r2, [r3, #SSP_OFFSET_CR1]
	nop
	mov	sp, r7
	add	sp, sp, #24
	pop	{r7, pc}


    .text
    .global  SSP0_Tx_Data_Request
	.thumb
	.thumb_func
    .type	SSP0_Tx_Data_Request, %function
SSP0_Tx_Data_Request:
	push	{r7, lr}
	sub	sp, sp, #8
	add	r7, sp, #0
	str	r0, [r7, #4]
	nop
TX_EMPTY_WAIT:
	ldr	r3, =LPC_SSP0_BASE
	ldr	r3, [r3, #SSP_OFFSET_SR]
	movs	r2, #(SSP_STAT_TNF|SSP_STAT_BSY)
	ands	r3, r2
	cmp	r3, #2
	bne	TX_EMPTY_WAIT
	ldr	r3, =LPC_SSP0_BASE
	ldr	r2, [r7, #4]
	str	r2, [r3, #SSP_OFFSET_DR]
	nop
TX_COMP_WAIT:
	ldr	r3, =LPC_SSP0_BASE
	ldr	r3, [r3, #SSP_OFFSET_SR]
	movs	r2, #16
	ands	r3, r2
	bne	TX_COMP_WAIT
	nop
	nop
	mov	sp, r7
	add	sp, sp, #8
	pop	{r7, pc}
	.size	SSP0_Tx_Data_Request, .-SSP0_Tx_Data_Request
