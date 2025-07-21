if (obj_player.current_star_count == obj_player.total_star_count && place_meeting(x, y, obj_player)) {
    audio_stop_all();
    obj_player.movement_enabled = false;
    if (transition_timer == total_transition_timer) {
        reset_lights();
        room_goto(next_room);
    } else {
        transition_timer++
        transition_alpha = transition_timer/total_transition_timer;
    }
}