cmake_minimum_required(VERSION 3.16)
set(CMAKE_TOOLCHAIN_FILE ${CMAKE_CURRENT_SOURCE_DIR}/cmake/toolchain-ch32v00x.cmake)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(CMAKE_BUILD_TYPE "Release")
# set(CMAKE_BUILD_TYPE "Debug")

project(firmware)

if(${CMAKE_BUILD_TYPE} STREQUAL "Release")
    add_compile_definitions(USE_PROGRAMMING_PIN_AS_GPIO)
endif()
add_compile_definitions(USE_XTAL_PINS_AS_GPIO)
add_compile_definitions(UART_BOOT_RECEIVE_SERVICE)
add_compile_definitions(UART_COMMANDS_RECEIVE_SERVICE)
add_compile_definitions(USE_PC0_AS_BOOT_SOURCE)
add_compile_definitions(FLASH_CONFIG_SECTION)    

set(TARGET_ELF ${PROJECT_NAME}.elf)
add_executable(${TARGET_ELF} src/main.c)
enable_language(C CXX ASM)
target_compile_features(${TARGET_ELF} PRIVATE cxx_std_17)

add_subdirectory(wch)
add_subdirectory(arduino)
add_subdirectory(lib)

add_custom_command(TARGET ${TARGET_ELF} POST_BUILD
    COMMAND ${CROSS_OBJDUMP} "-CdSx" $<TARGET_FILE:${TARGET_ELF}> > $<TARGET_FILE:${TARGET_ELF}>.lst
    COMMENT "Generating disassembler file")
add_custom_command(TARGET ${TARGET_ELF} POST_BUILD
    COMMAND ${CROSS_OBJCOPY} "-Obinary" $<TARGET_FILE:${TARGET_ELF}> $<TARGET_FILE:${TARGET_ELF}>.bin
    COMMENT "Generating bin file")
add_custom_command(TARGET ${TARGET_ELF} POST_BUILD
    COMMAND ${CROSS_OBJCOPY} "-Oihex" $<TARGET_FILE:${TARGET_ELF}> $<TARGET_FILE:${TARGET_ELF}>.hex
    COMMENT "Generating hex file")

add_custom_target(flash
        COMMAND openocd -f ${CMAKE_CURRENT_SOURCE_DIR}/wch/wch-riscv.cfg
            -c init
            -c halt
            -c "flash erase_sector wch_riscv 0 last"
            -c "program ${TARGET_ELF} verify"
            -c wlink_reset_resume
            -c exit
        WORKING_DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}
        DEPENDS ${tgt}
        COMMENT "Running openocd ${tgt_name}"
        USES_TERMINAL)
