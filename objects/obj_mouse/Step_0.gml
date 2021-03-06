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
		// hide score grid
		for (var i = 0; i < 9; ++i;) {
			instance_find(obj_whiteTile,i).visible = false;
	    }

		// update player score
		for (var cy = -1; cy <= 1; ++cy) {
			for (var cx = -1; cx <= 1; ++cx) {
				// compute grid coordinates for cell (cx, cy)
				var gx = gridX + cx;
				var gy = gridY + cy;
			
				var s = scr_cellScore(gx, gy, global.houseType);
				global.score += s
			}
		}

		// place a building on the map
		var lay_id2 = layer_get_id("Buildings_layer");
		var map_id2 = layer_tilemap_get_id(lay_id2);
		tilemap_set(map_id2,global.houseType,gridX,gridY);
		
		global.build = false;
		global.houseId.visible = false;
		global.buildingsLeft -= 1;
		
		if (global.buildingsLeft == 0 ) {
			if (global.score >= 5){
				//room_goto(rm_level2);
				room_goto_next();
			} else {
				room_goto(rm_gameOver);
			}
	
		}
	}	
	
	
}



if (global.build ) {
	// (gridX, gridY) grid coordinates of cell under the mouse
	gridX = floor(mouse_x/16);
	gridY = floor(mouse_y/16);

	var iid = 0;
	for (var cy = -1; cy <= 1; ++cy) {
		for (var cx = -1; cx <= 1; ++cx) {
			// for each instance of obj_whiteTile
			var instance = instance_find(obj_whiteTile, iid);
			instance.visible = true; // make the instance visible
			
				
			// compute grid coordinates for cell (cx, cy)
			var gx = gridX + cx;
			var gy = gridY + cy;
			
			var s = scr_cellScore(gx, gy, global.houseType);
			if s < 0 {
				instance.image_blend = c_red 
			} else if s > 0 {
				instance.image_blend = c_green
			} else {
				instance.image_blend = c_white
			}
				
			// move the instance to the pixel coordinates of the cell
			instance.x = gx*16;
			instance.y = gy*16;

			++iid;
		}
	}
}

