/// @description Changing Tiles with code

// Use the canbuild_layer to put new buildings (number 52)

if (global.build && mouse_check_button_pressed(mb_left)){
	//mouse position
	gridX = floor(mouse_x/16);
	gridY = floor(mouse_y/16);
	
	// data = which tile
	var lay_id1 = layer_get_id("CanBuild_layer");
	var map_id1 = layer_tilemap_get_id(lay_id1);
	var data = tilemap_get(map_id1, gridX, gridY);
	
	//show_debug_message("data = " + string(data));
	
	if (data == 1) {
		var lay_id2 = layer_get_id("Buildings_layer");
		var map_id2 = layer_tilemap_get_id(lay_id2);
		// set building number 52 on mouse position
		tilemap_set(map_id2,global.houseType,gridX,gridY);
		global.build = false;
	}	
	
	
}

if (global.build ) {
	gridX = floor(mouse_x/16);
	gridY = floor(mouse_y/16);

	obj_whiteTile.visible = true;
	obj_whiteTile.x = gridX*16
	obj_whiteTile.y = gridY*16
	
	
}
