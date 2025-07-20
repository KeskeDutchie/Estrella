event_inherited();

damage = 1;

// Assigned when created
my_arm = -1;        // Which arm I belong to
my_index = -1;      // Which position I am in the arm
my_controller = noone; // Reference to controller

light_id = light_check();

update_lights();

function update_lights() {
	if (array_length(global.lights) <= light_id) return;
	global.lights[light_id] = [x, y];
	global.intensities[light_id] = 30;
	global.light_colors[light_id] = [1,0.5,0.1];
}