## The project is a mix and improvement of several projects: 
* [ch32v307-cmake-vsc-noos-template](https://github.com/sadkotheguest/ch32v307-cmake-vsc-noos-template)
* [arduino-wch32v003](https://github.com/AlexanderMandera/arduino-wch32v003)

# CH32V003 Arduino-Like project template
![specifications](docs/specifications.png)
This project provide a functional cmake project for ch32v003 MCU using standard RISC-V GCC toolchain. Programming is carried out in the Arduino or Platformio style, that is, using a usb-uart and a built-in bootloder.

## Prepare SDK steps
 - Download [toolchain](https://disk.yandex.ru/d/RmjCNxb3dcRByQ) ([mirror](https://drive.google.com/file/d/1hytLr7pkEfrvUR4fV7C-jODg7oK6aswY/view?usp=sharing)) and place it in the same directory as the project folder.
 - Install [cmake](https://cmake.org/download/)
 - Install [git](https://git-scm.com/downloads/win)
 - Install [python](https://www.python.org/downloads/windows/)
 - Install python lib `pip install pyserial`
 - Install [vscode](https://code.visualstudio.com/) and install extensions
 - `code --install-extension ms-vscode.cpptools`
 - `code --install-extension ms-vscode.cmake-tools`
 - `code --install-extension twxs.cmake`
 - `code --install-extension marus25.cortex-debug`
 - `code --install-extension dan-c-underwood.arm`
 - `code --install-extension zixuanwang.linkerscript`
 - `code --install-extension badlogicgames.serial-plotter`
 - `code --install-extension sanaajani.taskrunnercode`
 - `code --install-extension ms-vscode.cpptools-extension-pack`
 - `code --install-extension eamodio.gitlens`
 - `code --install-extension github.vscode-pull-request-github`
 - Install drivers for usb-uart
 - change COM18 in `tasks.json` to you serial
 - clone this repo `git clone https://github.com/karasevia/ch32v003_arduino_vsc.git`

## Development steps
![board_view](docs/board_view.PNG)
 - enjoy

## Debug with OpenOCD
<<<<<<< HEAD
 - change [CMAKE_BUILD_TYPE](cmake/toolchain-ch32v00x.cmake#L47) to Debug
=======
 - change [CMAKE_BUILD_TYPE](cmake/toolchain-ch32v00x.cmake) to Debug
>>>>>>> 855a74e11b6468fdc04fecf04d59268cc54b9858
 - switch to Run and Debug (ctrl + shift + D)
 - Debug

## Usefull
![mcu_view](docs/ch32v003f4p6.svg)
