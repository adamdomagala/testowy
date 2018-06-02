cmake_minimum_required(VERSION 3.8)
project(Klient)

set(CMAKE_C_STANDARD 99)
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall")
set(SOURCE_FILES main.c)
add_executable(Klient ${SOURCE_FILES})