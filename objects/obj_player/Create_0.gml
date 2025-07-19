move_speed = 2;

x_velocity = 0;
y_velocity = 0;

movement_enabled = true;

hp = 100;
hp_visual = 100;
hp_delayed = 100;

function take_damage(damage) {
    hp -= damage;
}

function update_hp() {
    hp_visual = lerp(hp_visual, hp, 0.25);
    hp_delayed = lerp(hp_delayed, hp, 0.05);
}

light_id = light_check();

function update_lights()
{
	if (array_length(global.lights) <= light_id) return;
	global.lights[light_id] = [x, y];
	global.intensities[light_id] = 50;
}