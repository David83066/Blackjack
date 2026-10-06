button_text = "Replace Bet";

action = function()
{
    if (obj_game.previous_bet <= obj_game.current_chips)
    {
        obj_game.current_bet = obj_game.previous_bet;
        obj_game.betting = false;
        obj_game.current_chips -= obj_game.current_bet;
        audio_play_sound(snd_button_click, 0, false);
    }
    else
    {
        audio_play_sound(snd_button_click_fail, 0, false);
    }
}