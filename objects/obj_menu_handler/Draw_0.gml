for (var i = 0; i < array_length(option_x); i++)
{
	draw_sprite_ext(option_sprites[i],selected == i ,option_x[i], option_y[i], 1, 1, 0, c_white, (selected == i)? 1 : 0.4);
}