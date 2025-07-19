move_speed = 2;

x_velocity = 0;
y_velocity = 0;

movement_enabled = true;

hp = 100;
hp_visual = 100;
hp_delayed = 100;

max_time = 3*60*60;
time = 3*60*60;

death_anim_time = audio_sound_length(snd_death)*60;

function take_damage(damage) {
    hp -= damage;
}

function update_hp() {
    hp_visual = lerp(hp_visual, hp, 0.25);
    hp_delayed = lerp(hp_delayed, hp, 0.05);
}

light_id = light_check();

function update_lights() {
	if (array_length(global.lights) <= light_id) return;
	global.lights[light_id] = [x, y];
	global.intensities[light_id] = 50;
}

function draw_clock(x, y, radius, percent, col) {
    percent = clamp(percent, 0, 1);

    var start_angle = 90; // Start at the top
    var sweep_angle = 360 * percent;

    var steps = max(8, ceil(sweep_angle / 10));
    var angle_step = sweep_angle / steps;

    draw_set_color(col);
    draw_primitive_begin(pr_trianglefan);
    draw_vertex(x, y); // center point

    for (var i = 0; i <= steps; i++) {
        // CLOCKWISE: ADD angle_step instead of subtracting
        var angle = start_angle + (i * angle_step);
        var px = x + lengthdir_x(radius, angle);
        var py = y + lengthdir_y(radius, angle);
        draw_vertex(px, py);
    }

    draw_primitive_end();
}

function reset() {
	reset_lights();
    room_restart();
}