set(EXE_NAME GeometryMap)

file(GLOB SOURCES "*.cpp" "*.h")
add_executable(${EXE_NAME} ${SOURCES})

include_directories(
    ${GLFW_DIR}/include
    ${GLEW_DIR}/include
    ${3rdParty_DIR}/glm
    ${3rdParty_DIR}
)

target_link_libraries(${EXE_NAME}
optimized ${GLFW_DIR}/build/src/Release/glfw3.lib
debug  ${GLFW_DIR}/build/src/Debug/glfw3.lib
optimized ${GLEW_DIR}/lib/Release/x64/glew32s.lib  
debug  ${GLEW_DIR}/lib/Debug/x64/glew32sd.lib
glm
opengl32.lib
gdi32.lib 
winmm.lib
)