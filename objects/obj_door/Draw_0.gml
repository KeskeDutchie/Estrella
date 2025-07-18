if (solid) {draw_sprite(spr_door_locked, 0, x, y)}
if (!solid) {draw_sprite(spr_door_unlocked, 0, x, y)}

if (linked_lever.powered) {solid = false;}