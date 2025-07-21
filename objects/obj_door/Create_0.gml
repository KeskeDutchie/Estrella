light_id = light_check();

function update_light()
{
	if (array_length(global.lights) <= light_id) return;
	switch (image_angle)
	{
		case 0:
			global.lights[light_id] = [x, y - 16];
			break;
		case 90:
			global.lights[light_id] = [x - 16, y];
			break;
		case 180 | -180:
			global.lights[light_id] = [x, y + 16];
			break;
		case 270 | -90:
			global.lights[light_id] = [x + 16, y];
			break;
	}

	global.intensities[light_id] = 40;
}