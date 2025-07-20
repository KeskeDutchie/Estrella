if (place_meeting(x, y, obj_player)) {
    obj_player.time += time_gain;
    audio_play_sound(snd_clock, 0, false);
    instance_destroy();
}