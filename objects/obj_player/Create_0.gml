move_speed = 2;

x_velocity = 0;
y_velocity = 0;

movement_enabled = true;

hp = 100;
hp_visual = 100;
hp_delayed = 100;

red_timer = 0;
green_timer = 0;

bar_x = display_get_gui_width()*(1/64);
bar_y = display_get_gui_height()*(1/3);
bar_width = display_get_gui_width()*(1/64);
bar_height = display_get_gui_height()*(1/3);
border_padding = 8;

outer_x = bar_x - border_padding;
outer_y = bar_y - border_padding;
outer_width = bar_width + border_padding * 2;
outer_height = bar_height + border_padding * 2;

max_time = 3*60*60;
time = max_time;

total_star_count = 0;
current_star_count = 0;

death_anim_time = audio_sound_length(snd_death)*60;
death_message = spr_death_message;

// music_queue = mus_0;
current_music = audio_play_sound(mus_0, 0, true);
current_music_asset = mus_0;

function take_damage(damage) {
    hp -= damage;
    if (hp > 0 && damage > 0) {
        red_timer = 125;
		green_timer = 0;
        audio_play_sound(snd_hurt, 0, false);
    }
	else if (hp > 0)
	{
		green_timer = 125;
		red_timer = 0;
	}
	hp = clamp(hp, -100, 100);
}

function update_hp() {
    hp_visual = lerp(hp_visual, hp, 0.25);
    hp_visual = clamp(hp_visual, 0, 100);
    hp_delayed = lerp(hp_delayed, hp, 0.05);
    hp_delayed = clamp(hp_delayed, 0, 100);
}

light_id = light_check();

function update_lights() {
	if (array_length(global.lights) <= light_id) return;
	global.lights[light_id] = [x, y];
	global.intensities[light_id] = 50;
	global.light_colors[light_id] = [1,1,1];
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

function changeSong(song_asset) {
    if (song_asset == current_music_asset) return;

    // Get normalized progress through the current song (0.0 to 1.0)
    var current_progress = audio_sound_get_track_position(current_music) / getSongLength(current_music_asset);
    current_progress = clamp(current_progress, 0, 1); // Safety

    // Stop old music
    audio_stop_sound(current_music);

    // Play new music and sync to same progress point
    current_music = audio_play_sound(song_asset, 0, true);
    var new_pos = current_progress * getSongLength(song_asset);
    audio_sound_set_track_position(current_music, new_pos);

    current_music_asset = song_asset;
}

function getSongLength(song_asset) {
    return audio_sound_length(song_asset);
}

function setMaxTime(max_time_in_seconds) {
    max_time = max_time_in_seconds*60;
    time = max_time;
}