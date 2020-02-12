#version 450 core

layout(local_size_x = 16, local_size_y = 16) in;
layout(rgba32f, binding = 0) uniform image2D output_image;

uniform float elapsed_time;
uniform float delta_time;
uniform ivec2 mouse_coord;
uniform int frame_count;

#define pi 3.141
#define surf_dist .001
#define max_steps  200
#define max_dist 50.

mat3 look_at(vec3 d)
{
	vec3 r = normalize(cross(vec3(0, 1, 0), d));
	vec3 u = normalize(cross(d, r));
	return mat3(r, u, d);
}

mat2 rot(float a)
{
	return mat2(
		cos(a), -sin(a),
		sin(a), cos(a)
	);
}

float smin(float a, float b, float k)
{
	float h = clamp( 0.5+0.5*(b-a)/k, 0.0, 1.0 );
	return mix( b, a, h ) - k*h*(1.0-h);
}

float smax(float a, float b, float k)
{
	return -smin(-a, -b, k);
}

float sphere(vec3 p, float r)
{
	return length(p) - r;
}

float roundcube(vec3 p, vec2 r)
{
	return length(max(abs(p) - (r.x - r.y), vec3(0))) - r.y;
}

float roundcube(vec3 p, vec4 r)
{
	return length(max(abs(p) - (r.xyz - r.w), vec3(0))) - r.w;
}

float cube(vec3 p, float r)
{
	return roundcube(p, vec2(r, .0));
}

float cube(vec3 p, vec3 r)
{
	return roundcube(p, vec4(r, 0));
}

float quickcube(vec3 p, float r)
{
	p = abs(p);
	return max(p.x, max(p.y, p.z)) - r;
}

float quickcube(vec3 p, vec3 r)
{
	p = abs(p);
	return max(p.x - r.x, max(p.y - r.y, p.z - r.z));
}

float plane(vec3 p, vec3 n, float r)
{
	return dot(p, n) - r;
}

float line(vec3 p, vec3 a, vec3 b, float r)
{
	vec3 ab = b - a;
	vec3 ap = p - a;
	float h = clamp(dot(ap, ab) / dot(ab, ab), 0., 1.);
	return length(ap - h * ab) - r;
}

float torus(vec3 p, vec2 r)
{
	vec3 p0 = normalize(vec3(p.xy, 0)) * r.x;
	return length(p0 - p) - r.y;
}

float onion(float d, float thickness)
{
	return abs(d + thickness) - thickness;
}

vec3 elongate(vec3 p, vec3 a, vec3 b)
{
	return max(min(p, a), p - b);
}

float scene(vec3 p)
{
	float lo = max_dist;

	lo = min(lo, plane(p, vec3(0, 1, 0), -3.));

	float t0 = min(lo, torus(p, vec2(1, .5)));
	vec3 p0 = p;
	p0.xy = rot(elapsed_time * .6) * p0.xy;
	p0.x -= .7;
	p0.xy = rot(-elapsed_time) * p0.xy;
	t0 = onion(t0, .1);
	t0 = smax(t0, -plane(p, normalize(vec3(1, 1, 1)), -.4), .1);
	t0 = smin(t0, roundcube(p0, vec2(.6, .1)), .5);

	

	lo = min(lo, t0);
	return lo;
}

bool march(vec3 ro, vec3 rd, out vec3 p, out float steps)
{
	p = ro;
	float lo = .0;

	for (int i = 0; i < max_steps && lo < max_dist; ++i) {
		float l = scene(p);
		lo += l;
		p += l * rd;
		steps = 1. - float(i) / max_steps;

		if (l < surf_dist)
			return true;
	}

	return false;
}

vec3 normal(vec3 p)
{
	float l = scene(p);
	vec2 e = vec2(0, .001);

	return normalize(
		l - vec3(
			scene(p - e.yxx),
			scene(p - e.xyx),
			scene(p - e.xxy)
		)
	);
}

void main() {
	vec2 output_size = vec2(imageSize(output_image));
  vec2 output_coord = gl_GlobalInvocationID.xy;
	if (output_coord.x >= output_size.x || output_coord.y >= output_size.y) return;

	vec2 uv = (output_coord - output_size * .5) / output_size.y;
	vec3 c = vec3(0);
  vec2 m = vec2(mouse_coord - output_size * .5) / output_size.y;

	vec2 m2 = m * pi;
	vec3 ro = vec3(sin(m2.x) * cos(m2.y), sin(m2.y), cos(m2.x) * cos(m2.y)) * -5.;
	vec3 rd = look_at(normalize(-ro)) * normalize(vec3(uv, 1));

	vec3 p;
	float steps;
	if (march(ro, rd, p, steps)) {
		vec3 n = normal(p);
		c.r += .1 + .9 * max(.0, dot(-rd, n));

		c *= smoothstep(1., 0., length(ro - p) / max_dist);
	}
	c.b += 1. - floor(steps *steps* 10.) / 10.;

	imageStore(output_image, ivec2(output_coord), vec4(c, 1));
}
