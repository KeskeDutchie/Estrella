if (distance_to_object(obj_player) < 30)
{
	obj_player.take_damage(-0.3);
	if (!healing)
	{
		audio_play_sound(snd_heal, 0, false);
		var vfx = instance_create_layer(obj_player.x, obj_player.y - 16, "VFX", obj_vfx);
		vfx.sprite_index = spr_heal_vfx;
	}
	healing = true;
}
else
{
	healing = false;
}