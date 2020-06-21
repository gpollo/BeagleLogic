cmake_minimum_required(VERSION 3.10)

include(cmake/ti-pru-setup.cmake)
project(beaglelogic-firmware C ASM)

add_compile_options(-v3 -O2 --display_error_number --endian=little --hardware_mac=on -ppd -ppa)
add_link_options(--reread_libs --warn_sections --stack_size=0x100 --heap_size=0x100)
add_link_options(--library=${PRU_SWPKG_LIB_PATH}/rpmsg_lib.lib)
add_link_options(${CMAKE_SOURCE_DIR}/AM335x_PRU.cmd)
include_directories(${PRU_SWPKG_INCLUDE_PATH}/am335x)

add_executable(beaglelogic-pru0
    beaglelogic-pru0.c
    beaglelogic-pru0-core.asm
)

add_executable(beaglelogic-pru1
    beaglelogic-pru1.c
    beaglelogic-pru1-core.asm
)
