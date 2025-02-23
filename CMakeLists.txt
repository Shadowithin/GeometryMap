cmake_minimum_required(VERSION 3.18)

set(ENV(http_proxy) "http://127.0.0.1:7890")
set(ENV(https_proxy) "https://127.0.0.1:7890")
set(EXE_NAME GeometryMap)
set(CMAKE_CXX_STANDARD 20)
set(3rdParty_DIR ${CMAKE_CURRENT_SOURCE_DIR}/3rdParty) 

include(ExternalProject)
include(FetchContent)
set(FETCHCONTENT_BASE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/3rdParty)
set(FETCHCONTENT_QUIET OFF)

set_property(GLOBAL PROPERTY USE_FOLDERS ON)

project(${EXE_NAME})

# set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/bin/${CMAKE_BUILD_TYPE})
# set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/lib/${CMAKE_BUILD_TYPE})
# set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/lib/${CMAKE_BUILD_TYPE})

add_definitions(-DRESOURCE_DIR="${CMAKE_CURRENT_SOURCE_DIR}/resources")
add_definitions(-DSOURCE_DIR="${CMAKE_CURRENT_SOURCE_DIR}/src")

FetchContent_Declare(
    glew
    URL https://github.com/nigels-com/glew/releases/download/glew-2.2.0/glew-2.2.0.zip
    SOURCE_SUBDIR build/cmake
)

FetchContent_Declare(
    glfw
    GIT_REPOSITORY https://github.com/glfw/glfw.git
    GIT_TAG        3.4
)

FetchContent_Declare(
    glm
    GIT_REPOSITORY https://github.com/g-truc/glm.git
    GIT_TAG        1.0.1
)

FetchContent_Declare(
    assimp
    GIT_REPOSITORY https://github.com/assimp/assimp.git
    GIT_TAG        v5.4.3
)

FetchContent_Declare(
    stb
    GIT_REPOSITORY https://github.com/nothings/stb.git
    GIT_TAG        5c205738c191bcb0abc65c4febfa9bd25ff35234
)

FetchContent_MakeAvailable(glm glfw glew assimp stb)

# if (NOT EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/3rdParty/glew)
#     message(Downloading GLew...)
#     file(DOWNLOAD http://github.com/nigels-com/glew/releases/download/glew-2.2.0/glew-2.2.0.zip ${CMAKE_CURRENT_SOURCE_DIR}/3rdParty/glew.zip SHOW_PROGRESS)
#     file(ARCHIVE_EXTRACT INPUT ${CMAKE_CURRENT_SOURCE_DIR}/3rdParty/glew.zip DESTINATION ${CMAKE_CURRENT_SOURCE_DIR}/3rdParty)
#     file(RENAME ${CMAKE_CURRENT_SOURCE_DIR}/3rdParty/glew-2.2.0 ${CMAKE_CURRENT_SOURCE_DIR}/3rdParty/glew)
#     file(REMOVE ${CMAKE_CURRENT_SOURCE_DIR}/3rdParty/glew.zip)
# endif()

# include(${CMAKE_CURRENT_SOURCE_DIR}/3rdParty/opencv/OpenCVConfig.cmake)
# add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/3rdParty/glm)
# add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/3rdParty/glfw)
# add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/3rdParty/glew/build/cmake)
add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src)

function(config_target_output target_name)
    set_target_properties(${target_name} PROPERTIES 
        LIBRARY_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/bin
        ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/lib
        RUNTIME_OUTPUT_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/lib
    )
endfunction()

config_target_output(GeometryMap)
config_target_output(glfw)
config_target_output(glm)
config_target_output(glew)
config_target_output(glew_s)

# set_target_properties(glm PROPERTIES FOLDER 3rdParty)
# set_target_properties(glew PROPERTIES FOLDER 3rdParty)
# set_target_properties(glfw PROPERTIES FOLDER 3rdParty)
# set_property(GLOBAL PROPERTY PREDEFINED_TARGETS_FOLDER CMakeTargets)



