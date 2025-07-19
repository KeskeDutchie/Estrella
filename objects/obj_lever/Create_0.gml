depth = -y + room_height * 0.5;
powered = false;
light_id = light_check();



update_light();

function update_light()
{
	if (array_length(global.lights) <= light_id) return;
	global.lights[light_id] = [x, y];

	global.intensities[light_id] = 30;
}