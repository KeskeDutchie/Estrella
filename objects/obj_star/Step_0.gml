if (visible && place_meeting(x, y, obj_player)) {
    visible = false;
    audio_play_sound(snd_star, 0, false);
    duration = 0;
    obj_player.current_star_count++;
}

if (duration < 90) {
    duration++;
    global.intensities[light_id] = animcurve_channel_evaluate(channel, duration/90)*125;
    if (duration == 90) {
        instance_destroy();
    }
}