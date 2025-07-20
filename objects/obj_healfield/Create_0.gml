visible = false;
healing = false;

light_id = light_check();

update_lights();

function update_lights() {
	if (array_length(global.lights) <= light_id) return;
	global.lights[light_id] = [x, y];
	global.intensities[light_id] = 100;
	global.light_colors[light_id] = [0.2,1,0.2];
}