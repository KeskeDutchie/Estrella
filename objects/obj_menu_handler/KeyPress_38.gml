selected--;

if (selected < 0)
{
	selected += array_length(option_sprites);
}

audio_play_sound(snd_neon, 0, false);
