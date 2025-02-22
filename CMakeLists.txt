cmake_minimum_required(VERSION 3.18)
project(GeometryMap)

set(GLFW_DIR D:/Libraries/glfw-3.4) 
set(GLEW_DIR D:/Libraries/glew-2.1.0)
set(3rdParty_DIR ${CMAKE_CURRENT_SOURCE_DIR}/3rdParty) 

add_definitions(-DRESOURCE_DIR="${CMAKE_CURRENT_SOURCE_DIR}/resources")

add_subdirectory(${CMAKE_CURRENT_SOURCE_DIR}/src)



