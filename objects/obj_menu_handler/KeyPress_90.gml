switch (option_sprites[selected])
{
	case spr_start:
		reset_lights();
		audio_play_sound(snd_ui_confirm, 0, false);
		audio_stop_sound(mus_menu);
		room_goto_next();
	break;
	case spr_fullscreen:
		audio_play_sound(snd_ui_confirm, 0, false);
		window_set_fullscreen(!window_get_fullscreen());
	break;
	case spr_exit:
		game_end(0);
	break;
}

