/*
 * Arduino.h
 *
 *  Created on: Jan 12, 2023
 *      Author: larry
 */

#ifndef USER_ARDUINO_H_
#define USER_ARDUINO_H_

#include "debug.h"

int main();
void setup();
void loop();

#define A1 0xA1
#define A2 0xA2

#define C0 0xC0
#define C1 0xC1
#define C2 0xC2
#define C3 0xC3
#define C4 0xC4
#define C5 0xC5
#define C6 0xC6
#define C7 0xC7

#define D0 0xD0
#define D1 0xD1
#define D2 0xD2
#define D3 0xD3
#define D4 0xD4
#define D5 0xD5
#define D6 0xD6
#define D7 0xD7

#define LED_BUILTIN D1
#define BUTTON_BUILTIN A1

#define HIGH Bit_SET
#define LOW Bit_RESET

// GPIO pin states
enum {
	OUTPUT = 0,
	INPUT,
	INPUT_PULLUP,
	INPUT_PULLDOWN,
	INPUT_ANALOG
};

typedef struct {
	uint8_t data[62];
} config_t;

#define PROGMEM
#define memcpy_P memcpy
#define pgm_read_byte(s) *(uint8_t *)s
#define pgm_read_word(s) *(uint16_t *)s
#define serial_baudrate 460800
#define BOOT_INFO ((const char*)0x1FFFF740)

// Wrapper methods
void delay(unsigned int i);
void delayMicroseconds(unsigned int us);

#ifdef FLASH_CONFIG_SECTION
void save_config(config_t* config);
void read_config(config_t* config);
#endif //FLASH_CONFIG_SECTION

#ifdef UART_COMMANDS_RECEIVE_SERVICE
void command_callback(const char* cmd);
#endif // UART_COMMANDS_RECEIVE_SERVICE

//
// Digital pin functions use a numbering scheme to make it easier to map the
// pin number to a port name and number
// The GPIO ports A-D become the most significant nibble of the pin number
// for example, to use Port C pin 7 (C7), use the pin number 0xC7
//
void pinMode(uint8_t u8Pin, int iMode);
uint8_t digitalRead(uint8_t u8Pin);
void digitalWrite(uint8_t u8Pin, uint8_t u8Value);
uint16_t analogRead(uint8_t pin);

#endif /* USER_ARDUINO_H_ */
