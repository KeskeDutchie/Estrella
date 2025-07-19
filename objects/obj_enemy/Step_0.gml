if (pause_timer <= 0) {
    mp_potential_step(obj_player.x, obj_player.y, 3, false);
}

pause_timer--;

if (place_meeting(x, y, obj_player)) {
    obj_player.take_damage(damage);
    pause_timer = 3*60;
}



depth = -y + room_height * 0.5;