// List of arms
arms = [];
fireballs = [];

min_distance = 32; // how far from center fireballs must start


// create_fire_arm(5, 100, 0, 2, true);
// create_fire_arm(4, 96, 180, 1.5, false);
// create_fire_arm(2, 32, 0, 1, false);

function create_fire_arm(_fireball_count, _length, _angle_start, _speed, _clockwise) {
    var arm = {
        fireballs: _fireball_count,
        length: _length, // total radius of arm
        angle_start: _angle_start,
        speed: _speed, // degrees per frame
        clockwise: _clockwise
    };
    
    array_push(arms, arm);
}

for (var i = 0; i < array_length(arms); i++) {
    var arm = arms[i];
    fireballs[i] = [];

    for (var j = 0; j < arm.fireballs; j++) {
        var inst = instance_create_depth(x, y, depth - 1, obj_fireball);
        inst.my_arm = i;
        inst.my_index = j;
        inst.my_controller = id;
        fireballs[i][j] = inst;
    }
}