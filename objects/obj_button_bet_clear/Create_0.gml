button_text = "Clear Bet"

action = function()
{
    obj_game.current_bet = 0;
    audio_play_sound(snd_button_click, 0, false);
}