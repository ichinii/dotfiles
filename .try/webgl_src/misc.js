function default_vert_src() {
	return `
		attribute vec2 vertex_position;

		void main() {
			gl_Position = vec4(vertex_position, 0, 1);
		}
	`
}

function default_frag_src() {
	return `
		precision mediump float;

		void main() {
			vec2 uv = gl_FragCoord.xy / vec2(600, 400);

			gl_FragColor = vec4(uv, 0, 1);
		}
	`
}

function create_program(name, vert, frag) {
	const program = gl.createProgram()
	gl.attachShader(program, vert)
	gl.attachShader(program, frag)
	gl.linkProgram(program)

	if (!gl.getProgramParameter(program, gl.LINK_STATUS)) {
		alert("Unable to initialize the shader program (" + name + "): " + gl.getProgramInfoLog(program))
		return null
	}

	return program
}

function create_shader(name, type, src) {
	const shader = gl.createShader(type)
	gl.shaderSource(shader, src)
	gl.compileShader(shader)

	if (!gl.getShaderParameter(shader, gl.COMPILE_STATUS)) {
		alert("An error occurred compiling the shader (" + name + "): " + gl.getShaderInfoLog(shader))
		gl.deleteShader(shader)
		return null
	}

	return shader
}

function default_vertex_buffer() {
	const vertices = [
		-1.0, -1.0,
		 1.0, -1.0,
		-1.0,  1.0,
		 1.0,  1.0,
	]

	const buffer = gl.createBuffer()
	gl.bindBuffer(gl.ARRAY_BUFFER, buffer)
	gl.bufferData(gl.ARRAY_BUFFER, new Float32Array(vertices), gl.STATIC_DRAW)
	return buffer
}

function default_vertex_attribute_array(buffer) {
	gl.bindBuffer(gl.ARRAY_BUFFER, buffer)

	const count = 2
	const type = gl.FLOAT
	const normalize = false
	const stride = 0
	const offset = 0
	gl.vertexAttribPointer(
		0,
		count,
		type,
		normalize,
		stride,
		offset
	)
	gl.enableVertexAttribArray(0)
}

function init_() {
	window.canvas = document.getElementById("canvas")
	window.gl = canvas.getContext("webgl")

	for (extension of ext) {
		if (gl.getSupportedExtensions().indexOf(extension) < 0)
			alert("required webgl extension '" + extension + "' not supported by this browser")
		gl[extension] = gl.getExtension(extension)
	}

	init()
	requestAnimationFrame(draw_)
}

let ticks = 0
let previous_time = new Date()

function draw_() {
	++ticks
	let current_time = new Date()
	let elapsed_time = current_time - previous_time
	if (elapsed_time >= 1000) {
		let fps = Math.floor(1000 / elapsed_time * ticks)
		console.log(fps)

		previous_time = current_time
		ticks = 0
	}

	draw()
	requestAnimationFrame(draw_)
}
