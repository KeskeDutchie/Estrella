if (visible && place_meeting(x, y, obj_player)) {
    visible = false;
    duration = 0;
}

if (duration < 90) {
    duration++;
    global.intensities[light_id] = animcurve_channel_evaluate(channel, duration/90)*125;
}