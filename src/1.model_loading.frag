#version 450 core
layout (location = 0) out vec4 FragColor;

layout (location = 0) in vec2 TexCoords;
layout (location = 1) in vec4 Position;

uniform sampler2D texture_diffuse1;

void main()
{    
    FragColor = texture(texture_diffuse1, TexCoords);
//    FragColor = vec4(1.0);
}