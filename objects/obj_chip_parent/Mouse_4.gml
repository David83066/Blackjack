if (global.game_state = Game_State.betting and obj_game.betting == true)
{
    if ((obj_game.current_bet + chip_value) <= obj_game.current_chips)
    {
        audio_play_sound(snd_button_click, 0, false);
        obj_game.current_bet += chip_value;
    }
    else 
    {
    	audio_play_sound(snd_button_click_fail, 0, false);
    }
}