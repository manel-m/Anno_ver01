/// @description Changing Tiles with code

// Use the canbuild_layer to put new buildings (number 52)

if (mouse_check_button_pressed(mb_left)){
	gridX = floor(mouse_x/16);
	gridY = floor(mouse_y/16);
	
	
	var lay_id1 = layer_get_id("CanBuild_layer");
	var map_id1 = layer_tilemap_get_id(lay_id1);
	var data = tilemap_get(map_id1, gridX, gridY);
	
	//show_debug_message("data = " + string(data));
	
	if (data == 1) {
		var lay_id2 = layer_get_id("Buildings_layer");
		var map_id2 = layer_tilemap_get_id(lay_id2);
		tilemap_set(map_id2,52,gridX,gridY);
	}	
}
