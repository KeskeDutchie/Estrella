option_x = [384, 384, 384];
option_y = [32, 160, 288];

option_sprites = [spr_start, spr_fullscreen, spr_exit];

option_colors = [[1,1,0], [1,0,1] ,[1,0,0]]

selected = 0;

light_id_0 = light_check();
light_id_1 = light_check();
light_id_2 = light_check();

function update_lights() {
	if (array_length(global.lights) <= light_id_0) return;
	global.lights[light_id_0] = [option_x[selected] + sprite_get_width(option_sprites[selected]) * 0.5
	, option_y[selected] + sprite_get_height(option_sprites[selected]) * 0.5];
	global.intensities[light_id_0] = 100;
	global.light_colors[light_id_0] = option_colors[selected];
	
		if (array_length(global.lights) <= light_id_1) return;
	global.lights[light_id_1] = [option_x[selected]
	, option_y[selected] + sprite_get_height(option_sprites[selected]) * 0.5];
	global.intensities[light_id_1] = 100;
	global.light_colors[light_id_1] = option_colors[selected];
	
		if (array_length(global.lights) <= light_id_2) return;
	global.lights[light_id_2] = [option_x[selected] + sprite_get_width(option_sprites[selected])
	, option_y[selected] + sprite_get_height(option_sprites[selected]) * 0.5];
	global.intensities[light_id_2] = 100;
	global.light_colors[light_id_2] = option_colors[selected];
}