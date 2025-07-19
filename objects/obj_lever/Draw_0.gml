if (keyboard_check(vk_space))
	draw_text(x, y - 64, 
    "light_id: " + string(light_id) + 
    " | lights length: " + string(array_length(global.lights)) +
    " | slot exists: " + string(is_array(global.lights[light_id]))
);
if (powered) {draw_sprite(spr_lever_on, 0, x, y)}
if (!powered) {draw_sprite(spr_lever_off, 0, x, y)}