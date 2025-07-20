fireball_count = 3;
distance_between = 10;
fire_arm_count = 3;

fireballs = [];
for (var i = 0; i < fire_arm_count; i++) {
    for (var j = 0; j < fireball_count; j++) {
        fireballs[i][j] = instance_create_depth(x, y, depth, obj_fireball);
    }
}