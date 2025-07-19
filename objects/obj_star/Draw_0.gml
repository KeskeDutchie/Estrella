if (!anim_neg) {
    anim_time++;
    if (anim_time >= 100) {
        anim_neg = true;
    }
} else {
    anim_time--;
    if (anim_time <= 0) {
        anim_neg = false;
    }
}

draw_sprite_ext(spr_star, 0, x, y + sin(anim_time/100)*5, 1, 1, 0, c_white, 1)