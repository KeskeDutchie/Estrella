time--;
if (hp_visual > 0 && time > 0) {
    update_hp();
} else {
    if (time >= 0) {
        time = 0;
        audio_play_sound(snd_death, 0, false);
        sprite_index = spr_player_dead;
        movement_enabled = false;
    } else if (time <= -death_anim_time) {
        reset();
    }
}

update_lights();