if (array_length(global.lights) > 0) {
    shader_set(sh_light_elements);

    var u_lightCount     = shader_get_uniform(sh_light_elements, "u_lightCount");
    var u_lightPos       = shader_get_uniform(sh_light_elements, "u_lightPos");
    var u_lightIntensity = shader_get_uniform(sh_light_elements, "u_lightIntensity");

    shader_set_uniform_i(u_lightCount, array_length(global.lights));

    var posArray = [];
    var intensityArray = [];

    var cam = view_camera[0];
    var cam_x = camera_get_view_x(cam);
    var cam_y = camera_get_view_y(cam);
    var cam_w = camera_get_view_width(cam);
    var cam_h = camera_get_view_height(cam);

    // Match application surface space (used by gl_FragCoord)
    var surf_w = surface_get_width(application_surface);
    var surf_h = surface_get_height(application_surface);

    // Scale factor from world units to pixel units
    var scale_x = surf_w / cam_w;
    var scale_y = surf_h / cam_h;
    var scale_avg = (scale_x + scale_y) * 0.5; // uniform scaling

    for (var i = 0; i < array_length(global.lights); i++) {
	    var l = global.lights[i];

	    // Make sure it's a valid array with 2 elements (x, y)
	    if (!is_array(l) || array_length(l) < 2) {
	        continue; // skip invalid light entries
	    }

	    var screen_x = (l[0] - cam_x) * scale_x;
	    var screen_y = (l[1] - cam_y) * scale_y;

	    var world_intensity = global.intensities[i];
	    var pixel_intensity = world_intensity * scale_avg;

	    array_push(posArray, screen_x, screen_y);
	    array_push(intensityArray, max(pixel_intensity, 1));
	}

    shader_set_uniform_f_array(u_lightPos, posArray);
    shader_set_uniform_f_array(u_lightIntensity, intensityArray);

    draw_self();

    shader_reset();
}
else {
    draw_self();
}

draw_sprite_ext(spr_ghost_eyes, image_index, x, y, image_xscale, 1, 0, c_white, 0.4);
