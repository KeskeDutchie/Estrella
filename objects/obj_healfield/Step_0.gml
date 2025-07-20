if (distance_to_object(obj_player) < 30)
{
	obj_player.take_damage(-0.3);
	if (!healing)
	{
		audio_play_sound(snd_heal, 0, false);
	}
	healing = true;
}
else
{
	healing = false;
}