
vec4 format(vec3 color, float alpha)
{
	return vec4(color * alpha, alpha);
}
vec4 format(vec4 color)
{
	return format(color.rgb, color.a);
}
float clamp(float value)
{
	return clamp(value, 0., 1.);
}

void main()
{
	vec2 center = vec2(.5, .5);
	float progress = distance(v_tex_coord, center) * 2;
	progress = clamp((progress - inner_stop) / (outer_stop - inner_stop));
	
	vec4 color = mix(inner_color, outer_color, progress);
	gl_FragColor = format(color);
	
//	gl_FragColor = output(vec3(1, 0, 0), brightness);
	
//	vec4 color = texture2D(u_texture, v_tex_coord);
//	gl_FragColor = color * vec4(mix(bottomColor, topColor, v_tex_coord.y));
}
