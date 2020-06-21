if(NOT DEFINED ENV{PRU_CGT})
    set(ENV{PRU_CGT} /opt/ti-pru-cgt)
endif()

if(NOT DEFINED ENV{PRU_SWPKG})
    set(ENV{PRU_SWPKG} /opt/ti-pru-swpkg)
endif()

#####################
# $PRU_CGT/.../bin/ #
#####################

find_path(PRU_CGT_BIN_PATH
    NAMES bin
    PATHS $ENV{PRU_CGT}
    PATHS $ENV{PRU_CGT}/usr
    NO_DEFAULT_PATH
)

if (PRU_CGT_BIN_PATH)
    set(PRU_CGT_BIN_PATH ${PRU_CGT_BIN_PATH}/bin)
    message("Found '${PRU_CGT_BIN_PATH}'")
else()
    unset(PRU_CGT_BIN_PATH CACHE)
    message(FATAL_ERROR "Could not find binary path in $PRU_CGT")
endif()

#####################
# $PRU_CGT/.../lib/ #
#####################

find_path(PRU_CGT_LIB_PATH
    NAMES lib
    PATHS $ENV{PRU_CGT}
    PATHS $ENV{PRU_CGT}/usr/share/ti/cgt-pru
    NO_DEFAULT_PATH
)

if (PRU_CGT_LIB_PATH)
    set(PRU_CGT_LIB_PATH ${PRU_CGT_LIB_PATH}/lib)
    message("Found '${PRU_CGT_LIB_PATH}'")
else()
    unset(PRU_CGT_LIB_PATH CACHE)
    message(FATAL_ERROR "Could not find library path in $PRU_CGT")
endif()

link_directories(${PRU_CGT_LIB_PATH})

#########################
# $PRU_CGT/.../include/ #
#########################

find_path(PRU_CGT_INCLUDE_PATH
    NAMES include
    PATHS $ENV{PRU_CGT}
    PATHS $ENV{PRU_CGT}/usr/share/ti/cgt-pru
    NO_DEFAULT_PATH
)

if (PRU_CGT_INCLUDE_PATH)
    set(PRU_CGT_INCLUDE_PATH ${PRU_CGT_INCLUDE_PATH}/include)
    message("Found '${PRU_CGT_INCLUDE_PATH}'")
else()
    unset(PRU_CGT_INCLUDE_PATH CACHE)
    message(FATAL_ERROR "Could not find include path in $PRU_CGT")
endif()

include_directories(${PRU_CGT_INCLUDE_PATH})

#######################
# $PRU_SWPKG/.../lib/ #
#######################

find_path(PRU_SWPKG_LIB_PATH
    NAMES lib
    PATHS $ENV{PRU_SWPKG}
    NO_DEFAULT_PATH
)

if (PRU_SWPKG_LIB_PATH)
    set(PRU_SWPKG_LIB_PATH ${PRU_SWPKG_LIB_PATH}/lib)
    message("Found '${PRU_SWPKG_LIB_PATH}'")
else()
    unset(PRU_SWPKG_LIB_PATH CACHE)
    message(FATAL_ERROR "Could not find library path in $PRU_SWPKG")
endif()

link_directories(${PRU_SWPKG_LIB_PATH})

###########################
# $PRU_SWPKG/.../include/ #
###########################

find_path(PRU_SWPKG_INCLUDE_PATH
    NAMES include
    PATHS $ENV{PRU_SWPKG}
    NO_DEFAULT_PATH
)

if (PRU_SWPKG_INCLUDE_PATH)
    set(PRU_SWPKG_INCLUDE_PATH ${PRU_SWPKG_INCLUDE_PATH}/include)
    message("Found '${PRU_SWPKG_INCLUDE_PATH}'")
else()
    unset(PRU_SWPKG_INCLUDE_PATH CACHE)
    message(FATAL_ERROR "Could not find include path in $PRU_SWPKG")
endif()

include_directories(${PRU_SWPKG_INCLUDE_PATH})

#################
# set toolchain #
#################

set(CMAKE_TOOLCHAIN_FILE ${CMAKE_SOURCE_DIR}/cmake/ti-pru-toolchain.cmake)
