uniform float u_opacity;
uniform vec2 u_pattern_tl;
uniform vec2 u_pattern_br;
uniform float u_mix;

uniform sampler2D u_image;

varying vec2 v_pos;

void main() {

    vec2 imagecoord = mod(v_pos, 1.0);
    vec2 pos = mix(u_pattern_tl, u_pattern_br, imagecoord);
    vec4 color1 = texture2D(u_image, pos);
    color1.rgb *= color1.a;

    vec2 imagecoord2 = mod(imagecoord * 2.0, 1.0);
    vec2 pos2 = mix(u_pattern_tl, u_pattern_br, imagecoord2);
    vec4 color2 = texture2D(u_image, pos2);
    color2.rgb *= color2.a;

    vec4 color = mix(color1, color2, u_mix);
    color *= u_opacity;
    gl_FragColor = color;
}
