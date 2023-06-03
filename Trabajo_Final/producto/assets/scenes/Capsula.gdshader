shader_type canvas_item;

uniform float luminosity_amount = 0.5;
uniform float blink_speed = 1.0;


void fragment()
{
    float blink = abs(sin(TIME * blink_speed));
    COLOR = texture(TEXTURE, UV);
    COLOR.rgb += vec3(luminosity_amount * blink * 0.8);
}