red_timer = clamp(red_timer - 10, 0, 255);
draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, image_angle, make_color_rgb(255, 255-red_timer, 255-red_timer), image_alpha);