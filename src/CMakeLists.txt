set(EXE_NAME GeometryMap)

file(GLOB SOURCES "*.cpp" "*.h")
file(GLOB SHADERS "*.vert" "*.frag")
source_group("Shader Files" FILES ${SHADERS})
add_executable(${EXE_NAME} ${SOURCES} ${SHADERS})

include_directories(
    ${3rdParty_DIR}
    ${3rdParty_DIR}/glew-src/include
    ${3rdParty_DIR}/stb-src
)

target_link_libraries(${EXE_NAME}
glew_s
glfw
glm
assimp
# opencv_world
opengl32.lib
gdi32.lib 
winmm.lib
)
