#version 300 es

precision mediump float;

in vec2 v_texCoord;

uniform sampler2D depthMap;
uniform float near_plane;
uniform float far_plane;

out vec4 FragColor;

// required when using a perspective projection matrix
float LinearizeDepth(float depth)
{
    float z = depth * 2.0 - 1.0; // Back to NDC 
    return (2.0 * near_plane * far_plane) / (far_plane + near_plane - z * (far_plane - near_plane));	
}

void main()
{             
    float depthValue = texture(depthMap, v_texCoord).r;
    // FragColor = vec4(vec3(LinearizeDepth(depthValue) / far_plane), 1.0); // perspective
    // FragColor = vec4(vec3(depthValue), 1.0); // orthographic
    FragColor = vec4(1.0, 1.0, 1.0, 1.0); // orthographic
}