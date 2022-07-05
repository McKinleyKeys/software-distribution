
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
//	gl_FragColor = vec4(a_elapsed_time, 0., a_elapsed_time, 1.);
	
	float inner_stop = a_old_inner_stop;
	inner_stop += (a_new_inner_stop - a_old_inner_stop) * a_elapsed_time;
	
//	float x = v_tex_coord.x;
//	float y = v_tex_coord.y;
	vec2 center = vec2(.5, .5);
//	float progress = max(abs(x - .5), abs(y - .5)) * 2;
//	float progress = 1. - min(min(x, y), min(1. - x, 1. - y)) * 2.;
	float progress = distance(v_tex_coord, center) * 2.;
	progress = clamp((progress - inner_stop) / (u_outer_stop - inner_stop));
	
	vec4 color = mix(u_inner_color, u_outer_color, progress);
	gl_FragColor = format(color);
}
