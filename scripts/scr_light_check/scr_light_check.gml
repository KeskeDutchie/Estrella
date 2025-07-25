function light_check()
{
	if (!variable_global_exists("lights")) {
	    global.lights = [];
	}
	if (!variable_global_exists("intensities")) {
	    global.intensities = [];
	}
	if (!variable_global_exists("light_colors")) {
	    global.light_colors = [];
	}
	light_id = array_length(global.lights);
	
	global.lights[light_id] = [0, 0];
	global.intensities[light_id] = 0;
	global.light_colors[light_id] = [1, 1, 1];
	
	show_debug_message($"Light {light_id} registered");
	show_debug_message($"We have {array_length(global.lights)} lights");
	
	return light_id;
}

function reset_lights()
{
	global.lights = [];
	global.intensities = [];
	global.light_colors = [];
}