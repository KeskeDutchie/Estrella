triggered = place_meeting(x,y,obj_player);
image_index = triggered;

if (triggered)
	layer_set_visible(1, true);
else
{
	var _any_triggered = false;
	for (var _i = 0; _i < instance_number(obj_eye_panel); _i++)
	{
		if (instance_find(obj_eye_panel, _i).triggered)
		{
			_any_triggered = true;
			break;
		}
	}
	if (!_any_triggered)
	{
		layer_set_visible(1, false);
	}
}