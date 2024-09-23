target_sources(${TARGET_ELF} PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/source/ch32v00x_adc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/source/ch32v00x_dbgmcu.c
    ${CMAKE_CURRENT_SOURCE_DIR}/source/ch32v00x_dma.c
    ${CMAKE_CURRENT_SOURCE_DIR}/source/ch32v00x_exti.c
    ${CMAKE_CURRENT_SOURCE_DIR}/source/ch32v00x_flash.c
    ${CMAKE_CURRENT_SOURCE_DIR}/source/ch32v00x_gpio.c
    ${CMAKE_CURRENT_SOURCE_DIR}/source/ch32v00x_i2c.c
    ${CMAKE_CURRENT_SOURCE_DIR}/source/ch32v00x_iwdg.c
    ${CMAKE_CURRENT_SOURCE_DIR}/source/ch32v00x_misc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/source/ch32v00x_opa.c
    ${CMAKE_CURRENT_SOURCE_DIR}/source/ch32v00x_pwr.c
    ${CMAKE_CURRENT_SOURCE_DIR}/source/ch32v00x_rcc.c
    ${CMAKE_CURRENT_SOURCE_DIR}/source/ch32v00x_spi.c
    ${CMAKE_CURRENT_SOURCE_DIR}/source/ch32v00x_tim.c
    ${CMAKE_CURRENT_SOURCE_DIR}/source/ch32v00x_usart.c
    ${CMAKE_CURRENT_SOURCE_DIR}/source/ch32v00x_wwdg.c
    ${CMAKE_CURRENT_SOURCE_DIR}/include/ch32v00x_adc.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/ch32v00x_dbgmcu.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/ch32v00x_dma.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/ch32v00x_exti.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/ch32v00x_flash.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/ch32v00x_gpio.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/ch32v00x_i2c.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/ch32v00x_iwdg.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/ch32v00x_misc.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/ch32v00x_opa.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/ch32v00x_pwr.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/ch32v00x_rcc.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/ch32v00x_spi.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/ch32v00x_tim.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/ch32v00x_usart.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/ch32v00x_wwdg.h
    ${CMAKE_CURRENT_SOURCE_DIR}/include/ch32v00x.h
)

target_include_directories(${TARGET_ELF} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)
