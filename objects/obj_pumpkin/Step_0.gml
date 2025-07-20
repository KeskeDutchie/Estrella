if (place_meeting(x, y, obj_player)) {
    obj_player.take_damage(damage);
    pause_timer = 3*60;
}

global.lights[light_id] = [x, y];

switch (look_direction) {
    case "Down":
        if (!place_free(x, y + move_speed)) {
            setDirection("Up");
            break;
        }
        y += move_speed;
        break;
    case "Up":
        if (!place_free(x, y - move_speed)) {
            setDirection("Down");
            break;
        }
        y -= move_speed;
        break;
    case "Left":
        if (!place_free(x - move_speed, y)) {
            setDirection("Right");
            break;
        }
        x -= move_speed;
        break;
    case "Right":
        if (!place_free(x + move_speed, y)) {
            setDirection("Left");
            break;
        }
        x += move_speed;
        break;
}