event_inherited();

damage = 2;

look_direction = "Down";
move_speed = 0.5;

light_id = light_check();

global.intensities[light_id] = 100;

function setDirection(direction) {
    look_direction = direction;
    switch (direction) {
        case "Down":
            sprite_index = spr_pumpkin_d;
            break;
        case "Up":
            sprite_index = spr_pumpkin_u;
            break;
        case "Left":
            sprite_index = spr_pumpkin_l;
            break;
        case "Right":
            sprite_index = spr_pumpkin_r;
            break;
    }
}

setDirection("Down");