if (place_meeting(x, y, obj_player)) {
    obj_player.take_damage(damage);
}

update_lights();

if (instance_exists(my_controller)) {
    var arm = my_controller.arms[my_arm];
    var min_dist = my_controller.min_distance;

    // Calculate spacing dynamically
    var spacing = 0;
    if (arm.fireballs > 1) {
        spacing = (arm.length) / (arm.fireballs - 1);
    }

    var dist = spacing * my_index;

    // if (dist > arm.length) {
    //     instance_destroy();
    //     exit;
    // }

    var cx = my_controller.x;
    var cy = my_controller.y - 16;

    x = cx + lengthdir_x(dist, arm.angle_start);
    y = cy + lengthdir_y(dist, arm.angle_start);

    image_angle = point_direction(x, y, cx, cy);
}
