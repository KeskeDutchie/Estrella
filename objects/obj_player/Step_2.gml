time--;

update_hp();
if (hp_visual > 0 && time > 0) {
    if (time > max_time*0.75) {
        changeSong(mus_0);
    } else if (time > max_time*0.5) {
        changeSong(mus_1);
    } else if (time > max_time*0.25) {
        changeSong(mus_2);
    } else if (time > max_time*0.125) {
        changeSong(mus_3);
    } else {
        changeSong(mus_4);
    }
    // if (!audio_is_playing(current_music)) {
    //     current_music = audio_play_sound(current_music, 0, false);
    // }
} else {
    if (time >= 0) {
        time = 0;
        audio_stop_all();
        audio_play_sound(snd_death, 0, false);
        sprite_index = spr_player_dead;
        movement_enabled = false;
    } else if (time <= -death_anim_time) {
        reset();
    }
}


update_lights();