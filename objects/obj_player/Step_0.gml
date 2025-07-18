if (!movement_enabled) {return;}

var _hor_input, _ver_input, _sprint_input, _interact_input;
_hor_input = (keyboard_check(ord("D")) || keyboard_check(vk_right))-(keyboard_check(ord("A")) || keyboard_check(vk_left));
_ver_input = (keyboard_check(ord("S")) || keyboard_check(vk_down))-(keyboard_check(ord("W")) || keyboard_check(vk_up));
_sprint_input = keyboard_check(vk_shift) + 1;
_interact_input = keyboard_check(ord("E"));

var _len = sqrt(sqr(_hor_input) + sqr(_ver_input));

if (_len != 0) {
	_hor_input /= _len;
	_ver_input /= _len;
}

x_velocity = _hor_input * move_speed * _sprint_input;
y_velocity = _ver_input * move_speed * _sprint_input;

if (!place_free(x + x_velocity, y)) {
	if (place_meeting(x + x_velocity, y, obj_wallhurt)) {
		take_damage(obj_wallhurt.damage);
	}
	x_velocity = 0;
}

if (!place_free(x, y + y_velocity)) {
	if (place_meeting(x, y + y_velocity, obj_wallhurt)) {
		take_damage(obj_wallhurt.damage);
	}
	y_velocity = 0;
}

x += x_velocity;
y += y_velocity;

if (_interact_input && place_meeting(x, y, obj_lever) && !obj_lever.powered) {
	obj_lever.powered = true;
}