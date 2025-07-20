draw_set_color(c_red);
draw_rectangle(window_get_width()*(1/64), window_get_height()*(1/3), window_get_width()*(2/64), window_get_height()*(2/3), false);

draw_set_color(c_white);
draw_rectangle(window_get_width()*(1/64), window_get_height()*(1/3)+(window_get_height()*(1/3))*((100-hp_delayed)/100), window_get_width()*(2/64), window_get_height()*(2/3), false);

draw_set_color(c_green);
draw_rectangle(window_get_width()*(1/64), window_get_height()*(1/3)+(window_get_height()*(1/3))*((100-hp_visual)/100), window_get_width()*(2/64), window_get_height()*(2/3), false);

draw_set_color(c_white)
draw_text(window_get_width()*(2/64), window_get_height()*(1/2), string_concat(clamp(hp_visual, 0, 100), "%"));

draw_clock(32, 32, 32, (time/max_time), c_white);

if (time <= -3.2*60) {
    draw_sprite_ext(spr_death_message, 0, window_get_width()*(1/2), window_get_height()*(1/2), 2.5, 2.5, 0, c_white, 1);
}