triggered = place_meeting(x,y,obj_player);
image_index = triggered;

if (triggered) {
	layer_set_visible(layer_get_id("Shine"), true);
	if (!played_sound) {
		audio_stop_sound(snd_hide);
		audio_play_sound(snd_reveal, 0, false);
		played_sound = true;
	}
} else {
	if (played_sound) {
		audio_stop_sound(snd_reveal);
		audio_play_sound(snd_hide, 0, false);
		played_sound = false;
	}
	var _any_triggered = false;
	for (var _i = 0; _i < instance_number(obj_eye_panel); _i++)
	{
		if (instance_find(obj_eye_panel, _i).triggered)
		{
			_any_triggered = true;
			break;
		}
	}
	if (!_any_triggered)
	{
		layer_set_visible(layer_get_id("Shine"), false);
	}
}