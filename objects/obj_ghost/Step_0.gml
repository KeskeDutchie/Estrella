if (pause_timer <= 0) {
    mp_potential_step(obj_player.x, obj_player.y, 3, false);
	if (sprite_index != spr_ghost)
		sprite_index = spr_ghost;
}

pause_timer--;

if (place_meeting(x, y, obj_player)) {
    obj_player.take_damage(damage);
	if (pause_timer <= 0)
	{
		if (obj_player.hp > 0)
			audio_play_sound(snd_laugh, 0, false, 1.5);
		sprite_index = spr_ghost_laugh;
	}
    pause_timer = 3*60;
}

image_xscale = sign(obj_player.x - x); 

depth = -y + room_height * 0.4;