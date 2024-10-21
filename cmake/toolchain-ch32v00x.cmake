set(CMAKE_SYSTEM_NAME Generic)
set(CMAKE_SYSTEM_PROCESSOR RISC-V)

set(CROSSTOOL_PATH ${PROJECT_SOURCE_DIR}/../tools/riscv-embedded-gcc-12/bin CACHE PATH "Cross toolchain root directory")

function(find_toolchain)
  foreach(CROSS_PREFIX ${ARGV})
    find_program(CROSS_CC "${CROSS_PREFIX}gcc" "${CROSSTOOL_PATH}")
    find_program(CROSS_CXX "${CROSS_PREFIX}g++" "${CROSSTOOL_PATH}")
    find_program(CROSS_OBJDUMP "${CROSS_PREFIX}objdump" "${CROSSTOOL_PATH}")
    find_program(CROSS_OBJCOPY "${CROSS_PREFIX}objcopy" "${CROSSTOOL_PATH}")
    if (CROSS_CC AND CROSS_CXX AND CROSS_OBJCOPY AND CROSS_OBJCOPY)
      message("@@ found toolchain ${CROSS_CC}")
      set(CMAKE_C_COMPILER ${CROSS_CC} PARENT_SCOPE)
      set(CMAKE_CXX_COMPILER ${CROSS_CXX} PARENT_SCOPE)
      return()
    endif()
  endforeach()
endfunction()

find_toolchain("riscv-none-elf-")

set(CPU_FLAGS "-march=rv32ecxw -mabi=ilp32e -msmall-data-limit=0 -msave-restore -fmessage-length=0 -fsigned-char -ffunction-sections -fdata-sections -fno-common -Wunused -Wuninitialized")

set(COMMON_FLAGS "-std=gnu99 -MMD")

set(FLAGS_RELEASE "-Os")
set(FLAGS_DEBUG "-Og -g3")

set(CMAKE_C_FLAGS "${CPU_FLAGS} ${OPT_FLAGS} ${COMMON_FLAGS}")
set(CMAKE_C_FLAGS_RELEASE ${FLAGS_RELEASE})
set(CMAKE_C_FLAGS_DEBUG ${FLAGS_DEBUG})
set(CMAKE_CXX_FLAGS "${CPU_FLAGS} ${OPT_FLAGS} ${COMMON_FLAGS} -fno-rtti -fno-exceptions")
set(CMAKE_CXX_FLAGS_RELEASE ${FLAGS_RELEASE})
set(CMAKE_CXX_FLAGS_DEBUG ${FLAGS_DEBUG})
SET(CMAKE_ASM_FLAGS "${CFLAGS} ${CPU_FLAGS} -x assembler-with-cpp")

set(LD_FLAGS "${CPU_FLAGS} -Xlinker -g -lprintf -nostartfiles -Wl,--gc-sections -Wl,--print-memory-usage")
set(CMAKE_EXE_LINKER_FLAGS "${LD_FLAGS} --specs=nano.specs --specs=nosys.specs" CACHE INTERNAL " ${OPT_FLAGS}")

set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_PACKAGE ONLY)
