#include "arduino.h"
#include "string.h"

// the setup function runs once when you press reset or power the board

union config_u
{
    config_t raw;
    struct
	{
		u8 mode;
	};
} config;

void setup() {
  // initialize digital pin LED_BUILTIN as an output.
    pinMode(LED_BUILTIN, OUTPUT);
	#ifdef FLASH_CONFIG_SECTION
	read_config(&config.raw);
	#endif // FLASH_CONFIG_SECTION
}

// the loop function runs over and over again forever
static u8 led = 0;

void loop() {
	digitalWrite(LED_BUILTIN, led = !led);

	if (config.mode == 0) {
		delay(100);
	} else if (config.mode == 1) {
		delay(20);
	} else {
		delay(50);
	}
}

#ifdef UART_COMMANDS_RECEIVE_SERVICE
void command_callback(const char* cmd)
{
	const char prefix[] = "mode ";
	if (strlen(cmd) < sizeof(prefix)) {
		printf("argument error");
		return;
	}
	if (strncmp(cmd, prefix, sizeof(prefix) - 1) == 0) {
		switch (cmd[sizeof(prefix) - 1]) {
			case '0': config.mode = 0; break;
			case '1': config.mode = 1; break;
			default: printf("argument error"); return;
		}
		#ifdef FLASH_CONFIG_SECTION
		save_config(&config.raw);
		#endif // FLASH_CONFIG_SECTION
		printf("mode changed to %d\r\n", config.mode);
	}
}
#endif // UART_COMMANDS_RECEIVE_SERVICE
