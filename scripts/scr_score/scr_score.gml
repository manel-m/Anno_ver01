// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function scr_cellScore(_x, _y, _type) {
	if _type == 52
		return scr_scoreBuilding52(_x, _y)
	if _type == 67
		return scr_scoreBuilding67(_x, _y)
	if _type == 94
		return scr_scoreBuilding94(_x, _y)	
	if _type == 77
		return scr_scoreBuilding77(_x, _y)	
	return 0
}

function scr_scoreBuilding52(_x, _y) {
	var dataMountain = scr_hasData(_x,_y, "Mountains_layer");
	if (dataMountain != 0) {
		return -1
	} 
			
	var dataTree = scr_hasData(_x,_y, "Tree_layer");
	if (dataTree != 0) {
		return 1 
	}
	
	return 0
}


function scr_scoreBuilding67(_x, _y) {
	var dataMountain = scr_hasData(_x,_y, "Mountains_layer");
	if (dataMountain != 0) {
		return 1
	} 
	
	return 0
}

function scr_scoreBuilding94(_x, _y) {
	var dataBuildings = scr_hasData(_x,_y, "Buildings_layer");
	if (dataBuildings != 0) {
		return 1
	} 
	
	return 0
}

function scr_scoreBuilding77(_x, _y) {
	var data = scr_hasData(_x,_y, "Land_layer");
	if (data == 1 ) {
		return 0
	} 
	
	return 1
}



function scr_hasData(_x,_y,_layer){
	var lay_id = layer_get_id(_layer);
	var map_id = layer_tilemap_get_id(lay_id);
	var data = tilemap_get(map_id, _x, _y);
	return data
}