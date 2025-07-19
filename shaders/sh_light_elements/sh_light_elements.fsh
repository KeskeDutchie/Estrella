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

