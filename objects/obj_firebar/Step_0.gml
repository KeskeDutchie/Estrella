for (var i = 0; i < array_length(arms); i++) {
    var arm = arms[i];
    var dir = arm.clockwise ? 1 : -1;
    arm.angle_start = (arm.angle_start + dir * arm.speed) mod 360;
    arms[i] = arm; // Store back
}
