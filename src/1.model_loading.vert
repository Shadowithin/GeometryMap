#version 450 core
layout (location = 0) in vec3 aPos;
layout (location = 1) in vec3 aNormal;
layout (location = 2) in vec2 aTexCoords;

layout (location = 0) out vec2 TexCoords;
layout (location = 1) out vec4 Position;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

void main()
{
    TexCoords = aTexCoords;    
    Position = projection * view * model * vec4(aPos, 1.0);
//    gl_Position = projection * view * model * vec4(aPos, 1.0);
    gl_Position = vec4(aTexCoords * 2 - 1, 0.0, 1.0);
}