if (place_meeting(x, y, obj_player)) {
    obj_player.time += time_gain;
    instance_destroy();
}