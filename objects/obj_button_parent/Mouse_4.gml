if (global.game_state == Game_State.player_turn)
{
    action();
    audio_play_sound(snd_button_click, 0, false);
}