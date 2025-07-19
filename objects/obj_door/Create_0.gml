light_id = light_check();

function update_light()
{
	if (array_length(global.lights) <= light_id) return;
	global.lights[light_id] = [x, y - 16];

	global.intensities[light_id] = 40;
}