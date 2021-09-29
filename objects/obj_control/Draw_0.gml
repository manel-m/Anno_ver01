/// @description Insert description here
// You can write your code in this editor


switch (room) {
	case rm_level1:
	case rm_level2:
	case rm_level4:
	case rm_level5:
	case rm_mainGame:
		draw_text(20,20,"SCORE: " + string(global.score));
		break;
		
	case rm_start:
		draw_set_halign(fa_center);
		draw_text_transformed_color(
			room_width/2, 100, "ANNO GAME",
			5,5,0,c_yellow,c_red,c_green,c_lime,1);
		
		draw_text(
			room_width/2,300,">> PRESS ENTER TO START <<");
			draw_set_halign(fa_left);
		break;
		
	case rm_win:
		draw_set_halign(fa_center);
		draw_text_transformed_color(
			room_width/2, 200, "YOU WON!",
			5,5,0,c_lime,c_lime,c_lime,c_lime,1);
		draw_text(room_width/2,350,"FINAL SCORE: " + string(global.score));	
		
		draw_set_halign(fa_left);
		break;
		
	case rm_gameOver:
		draw_set_halign(fa_center);
		draw_text_transformed_color(
			room_width/2, 200, "GAME OVER",
			5,5,0,c_red,c_red,c_red,c_red,1);
		draw_text(room_width/2,350,"FINAL SCORE: " + string(global.score));	
		
		draw_set_halign(fa_left);
		break;

}