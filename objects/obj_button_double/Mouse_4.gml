if (global.game_state == Game_State.player_turn and button_available == true)
{
    action();
    audio_play_sound(snd_button_click, 0, false);
}
else if (global.game_state == Game_State.player_turn)
{
    audio_play_sound(snd_button_click_fail, 0, false);
}