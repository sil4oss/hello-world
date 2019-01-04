#
# Hello World
#
# Copyright (C) 2018 sil4oss
# Author: Wonguk Jeong <huchijwk@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

cmake_minimum_required(VERSION 3.5)
project(hello-world CXX)

list(APPEND SRCS
    ${CMAKE_CURRENT_SOURCE_DIR}/src/hello-world.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/src/main.cpp)

list(APPEND HEADERS
    ${CMAKE_CURRENT_SOURCE_DIR}/include/hello-world.hpp)

include_directories(${CMAKE_CURRENT_SOURCE_DIR}/include)

add_executable(${PROJECT_NAME} ${SRCS})

set(CMAKE_MODULE_PATH ${CMAKE_MODULE_PATH} ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

# cppcheck & MISRA C 2012
include(cppcheck)
add_cppcheck_target("${SRCS} ${HEADERS}")
