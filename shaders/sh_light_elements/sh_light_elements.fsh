// sh_light_elements.frag
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform int u_lightCount;
uniform vec2 u_lightPos[64];
uniform float u_lightIntensity[64];
uniform vec3 u_lightColor[64];

vec4 color;

void main() {
    color = vec4(1.0); // default to white (no tint)
    vec2 fragPos = gl_FragCoord.xy;
    vec4 baseColor = texture2D(gm_BaseTexture, v_vTexcoord) * v_vColour;

    float brightness = 0.0;

    for (int i = 0; i < 64; i++) {
        if (i >= u_lightCount) break;

        float dist = distance(fragPos, u_lightPos[i]);
        float intensity = u_lightIntensity[i];
        float light = clamp(1.0 - dist / intensity, 0.0, 1.0);

        if (light > brightness) {
            color = vec4(u_lightColor[i], 1.0);
        }
        brightness = max(brightness, light);
    }

    // Dark background with alpha preserved
    vec4 darkColor = vec4(0.0, 0.0, 0.0, baseColor.a);

    // Only apply light color to the lit baseColor
    gl_FragColor = mix(darkColor, vec4(baseColor.rgb * color.rgb, baseColor.a), brightness);
}
