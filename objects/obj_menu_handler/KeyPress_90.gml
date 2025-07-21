switch (option_sprites[selected])
{
	case spr_start:
		reset_lights();
		room_goto_next();
	break;
	case spr_fullscreen:
		window_set_fullscreen(!window_get_fullscreen());
	break;
	case spr_exit:
		game_end(0);
	break;
}
