if (place_meeting(x, y, obj_player)) {
    obj_player.time += time_gain;
    audio_play_sound(snd_clock, 0, false);
	var vfx = instance_create_layer(obj_player.x, obj_player.y - 16, "VFX", obj_vfx);
	vfx.sprite_index = spr_time_vfx;
    instance_destroy();
}