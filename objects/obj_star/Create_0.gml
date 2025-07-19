curve = animcurve_get(ac_lightflash);
channel = animcurve_get_channel(curve, 0);

light_id = light_check();

global.lights[light_id] = [x, y];
global.intensities[light_id] = 25;
duration = 90;

anim_time = 0;
anim_neg = false;