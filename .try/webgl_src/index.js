window.ext = []

function init() {
	const vert = create_shader("vert", gl.VERTEX_SHADER, default_vert_src())
	const frag = create_shader("frag", gl.FRAGMENT_SHADER, default_frag_src())
	window.program = create_program("program", vert, frag)

	window.buffer = default_vertex_buffer()

	gl.clearColor(0, 0, 0, 1)
}

function draw() {
	gl.useProgram(program)
	default_vertex_attribute_array(buffer)

	

	gl.clear(gl.COLOR_BUFFER_BIT)
	gl.drawArrays(gl.TRIANGLE_STRIP, 0, 4)
}
