draw_set_color(#222034);

draw_sprite_ext(spr_hp_icon, 0, bar_x, bar_y, 2, 2, 0, c_white, 1);
draw_rectangle(bar_x, bar_y, bar_x + bar_width, bar_y + bar_height, false);

draw_set_color(#d77bba);
if (hp_delayed > 0)
    draw_rectangle(bar_x, bar_y+bar_height*((100-hp_delayed)/100), bar_x + bar_width, bar_y + bar_height, false);

draw_set_color(#76428a);

if (hp_visual > 0)
    draw_rectangle(bar_x, bar_y+(bar_height)*((100-hp_visual)/100), bar_x + bar_width, bar_y + bar_height, false);

draw_sprite_ext(spr_healthbar_border, 0, outer_x, outer_y, outer_width / sprite_get_width(spr_healthbar_border), outer_height / sprite_get_width(spr_healthbar_border), 0, c_white, 1);

draw_set_color(c_white)
draw_sprite_ext(spr_stars_icon, 0, display_get_gui_width(), 0, 2, 2, 0, c_white, 1);
draw_set_font(fnt_default);
draw_text(display_get_gui_width()-110, 0, string_concat(current_star_count, "/", total_star_count));
//draw_text(window_get_width()*(2/64), window_get_height()*(1/2), string_concat(clamp(hp_visual, 0, 100), "%"));

draw_clock(32, 32, 32, (time/max_time), c_white);

if (time <= -3.2*60) {
    draw_sprite_ext(death_message, 0, display_get_gui_width()*(1/2), display_get_gui_height()*(1/2), 2.5, 2.5, 0, c_white, 1);
}