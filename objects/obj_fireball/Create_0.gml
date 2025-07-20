event_inherited();

light_id = light_check();

update_lights();

function update_lights() {
	if (array_length(global.lights) <= light_id) return;
	global.lights[light_id] = [x, y];
	global.intensities[light_id] = 30;
	global.light_colors[light_id] = [1,0.5,0.1];
}