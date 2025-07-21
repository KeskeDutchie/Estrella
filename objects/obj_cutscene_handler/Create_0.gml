animation_time = 0;
scene = "intro";
current_frame = 0;
total_transition_time = 30;
transition_time = 0;
transition_color = 255;
audio_play_sound(mus_cutscene, 0, true);

function set_scene(_scene) {
    scene = _scene;
}