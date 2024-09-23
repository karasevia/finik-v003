target_sources(${TARGET_ELF} PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/source/arduino.c
    ${CMAKE_CURRENT_SOURCE_DIR}/include/arduino.h
)

target_include_directories(${TARGET_ELF} PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/include)