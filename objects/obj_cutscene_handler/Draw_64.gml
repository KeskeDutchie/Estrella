animation_time++;

if (transition_time == 0 && (keyboard_check_pressed(ord("Z")) || animation_time > 60*10)) {
    if (keyboard_check_pressed(ord("Z")))
        audio_play_sound(snd_ui_confirm, 0, false);
    animation_time = 0;
    transition_time++;
}

if (transition_time > 0 && transition_time < total_transition_time*0.5) {
    transition_time++;
    transition_color = 255-(255*(transition_time/(total_transition_time*0.5)));
}

if (transition_time >= total_transition_time*0.5 && transition_time <= total_transition_time) {
    if (transition_time == total_transition_time*0.5) {
        current_frame++;
    }
    if (transition_time == total_transition_time) {
        transition_time = 0;
        transition_color = 255;
    } else {
        transition_time++;
        transition_color = clamp(255*((transition_time-total_transition_time*0.5)/(total_transition_time*0.5)), 0, 255);
    }
}

if (current_frame >= sprite_get_number(asset_get_index("spr_" + scene)))
    room_goto_next();

draw_sprite_ext(asset_get_index("spr_" + scene),
    current_frame,
    display_get_gui_width()*0.5,
    0,
    display_get_gui_height()/sprite_get_height(asset_get_index("spr_" + scene)),
    display_get_gui_height()/sprite_get_height(asset_get_index("spr_" + scene)),
    0,
    make_color_rgb(transition_color, transition_color, transition_color),
    1);