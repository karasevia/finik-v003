# FINIK CH32V003 SDK

Welcome to the finik-v003 SDK repository! This SDK aims to provide a seamless and efficient development environment for the CH32V003 microcontroller, leveraging the simplicity of an Arduino-style project structure with CMake.

## Overview

The CH32V003 microcontroller is a cost-effective option for various embedded systems projects. Our SDK ensures that both novice and experienced developers can quickly get started without the need for intricate setup or deep technical knowledge.

![specifications](docs/specifications.png)

### Key Features

- **Ease of Use**: Simple and intuitive setup process that parallels the Arduino IDE experience.
- **CMake Integration**: Streamlined project structure managed by CMake for advanced project configurations.
- **Comprehensive Tooling**: Essential VS Code extensions provided to enhance the development workflow.

## Getting Started (Windows)

To start using the SDK, follow the steps below:

1. **Download toolchain**:
	[toolchain](https://disk.yandex.ru/d/RmjCNxb3dcRByQ) ([mirror](https://drive.google.com/file/d/1hytLr7pkEfrvUR4fV7C-jODg7oK6aswY/view?usp=sharing)) and place it in the same directory as the project folder.
2. **Insatll prerequizits**:
   	[cmake](https://cmake.org/download/),  [git](https://git-scm.com/downloads/win), [python](https://www.python.org/downloads/windows/)
	Install python lib `pip install pyserial` (for sending commands to mcu)
3. **Install VS Code and extensions**:
   	[vscode](https://code.visualstudio.com/)
	 ```sh
  code --install-extension ms-vscode.cpptools --install-extension ms-vscode.cmake-tools --install-extension twxs.cmake --install-extension marus25.cortex-debug --install-extension dan-c-underwood.arm --install-extension zixuanwang.linkerscript --install-extension badlogicgames.serial-plotter --install-extension sanaajani.taskrunnercode --install-extension ms-vscode.cpptools-extension-pack --install-extension eamodio.gitlens --install-extension github.vscode-pull-request-github --install-extension awsxxf.serialterminal
```
	reload VS Code
4. **Install drivers for usb-uart**:
   	most popualar you can find in toolchain folder
5. **Clone the Repository**:
   	right-click "Open Git Bash Here"
   	git clone https://github.com/karasevia/finik-v003.git
6. **Set your serial port**:
	change `COM18` in [tasks.json](.vscode\tasks.json) to your serial
7. **Now you are ready start development!!**

## Development steps

![board_view](docs/board_view.PNG)
 - change delay time in the loop: [delay](src/main.c#L30)
 - open TASK RUNNER and run `[flash] update from programm`
 - see on your board

## Debug with OpenOCD

 - change [CMAKE_BUILD_TYPE](cmake/toolchain-ch32v00x.cmake#L47) to Debug
 - switch to Run and Debug (ctrl + shift + D)
 - Debug

## Configs

The last two pages are used to save some information during reloading and flashing. This allows you to save up to 62 bytes.
To use it, create an object with the structure as in the example:

```c
union config_u
{
    config_t raw;
    struct
	{
        uint8_t mode;
        uint8_t mac[6];
        uint8_t ipv4[4];
        char password[32];
    };
} config;
```

To read and write the settings, use the methods (if the data already matches, the memory is not overwritten):
```c
read_config(&config.raw);
save_config(&config.raw);
```

To use it, just call the structure variable:
```c
config.mode = 3;
if (config.ipv4[0] == 192 &&
    config.ipv4[0] == 168 &&
    config.ipv4[0] == 0   &&
    config.ipv4[0] == 31 
) {
    compare(password, config.password);
}
```

## Usefull

![mcu_view](docs/ch32v003f4p6.svg)

[Data Sheet](docs/CH32V003DS0.PDF)

[Reference Manual](docs/CH32V003RM.PDF)

### The project is a mix and improvement of several projects:
* [ch32v307-cmake-vsc-noos-template](https://github.com/sadkotheguest/ch32v307-cmake-vsc-noos-template)
* [arduino-wch32v003](https://github.com/AlexanderMandera/arduino-wch32v003)
