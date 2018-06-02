cmake_minimum_required(VERSION 3.8)
project(KlientAgent C)

set(CMAKE_C_STANDARD 99)
if(WIN32)
    link_libraries(ws2_32)
endif()
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall")
add_executable(KlientAgent main.c)
