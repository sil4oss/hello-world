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

# cppcheck & MISRA C 2012

function(add_cppcheck_target SRCS)

    include(ExternalProject)
    find_package(Git REQUIRED)
    separate_arguments(SRCS)

    set(CPPCHECK_PREFIX ${CMAKE_BINARY_DIR}/external/cppcheck)
    list(APPEND CPPCHECK_ARGS
        --std=c++14
        --verbose
        --enable=all
        --error-exitcode=1
        --language=c++
        --dump)

    foreach(SRC IN LISTS SRCS)
        list(APPEND CPPCHECK_DUMPS ${SRC}.dump)
    endforeach(SRC IN LISTS SRCS)

    ExternalProject_Add(
        CppCheck
        GIT_REPOSITORY https://github.com/danmar/cppcheck.git
        GIT_TAG 1.86
        CMAKE_ARGS -DCMAKE_INSTALL_PREFIX=${CPPCHECK_PREFIX}
        PREFIX ${CPPCHECK_PREFIX})

    add_custom_target(
        cppcheck
        COMMAND ${CPPCHECK_PREFIX}/bin/cppcheck ${CPPCHECK_ARGS} ${SRCS}
        COMMAND ${CPPCHECK_PREFIX}/src/CppCheck/addons/misra.py ${CPPCHECK_DUMPS}
        DEPENDS CppCheck)

endfunction(add_cppcheck_target SRCS)
