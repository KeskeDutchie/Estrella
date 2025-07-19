//
// Simple passthrough vertex shader
//
attribute vec3 in_Position;                  // (x,y,z)
//attribute vec3 in_Normal;                  // (x,y,z)     unused in this shader.
attribute vec4 in_Colour;                    // (r,g,b,a)
attribute vec2 in_TextureCoord;              // (u,v)

varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 object_space_pos = vec4( in_Position.x, in_Position.y, in_Position.z, 1.0);
    gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * object_space_pos;
    
    v_vColour = in_Colour;
    v_vTexcoord = in_TextureCoord;
}

//######################_==_YOYO_SHADER_MARKER_==_######################@~
// sh_light_elements.frag
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform int u_lightCount;
uniform vec2 u_lightPos[16];
uniform float u_lightIntensity[16];

void main() {
    vec2 fragPos = gl_FragCoord.xy;
    vec4 baseColor = texture2D( gm_BaseTexture, v_vTexcoord ) * v_vColour;

    float brightness = 0.0;

    for (int i = 0; i < 16; i++) {
        if (i >= u_lightCount) break;

        float dist = distance(fragPos, u_lightPos[i]);
        float intensity = u_lightIntensity[i];
        float light = clamp(1.0 - dist / intensity, 0.0, 1.0);

        brightness = max(brightness, light); // brightest light dominates
    }

    // Keep sprite alpha (don’t make things transparent)
    vec4 darkColor = vec4(0.0, 0.0, 0.0, baseColor.a);
    gl_FragColor = mix(darkColor, baseColor, brightness);
}


