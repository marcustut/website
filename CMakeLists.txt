cmake_minimum_required(VERSION 3.24)

project(website VERSION 1.0)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)
set(CMAKE_EXPORT_COMPILE_COMMANDS True)

add_subdirectory(include)

# Build website
add_executable(${CMAKE_PROJECT_NAME} 
    src/main.cpp
)
target_link_libraries(${CMAKE_PROJECT_NAME} uWebSockets)
#target_include_directories(${CMAKE_PROJECT_NAME} PRIVATE 
#    ${PROJECT_SOURCE_DIR}/include
#)

