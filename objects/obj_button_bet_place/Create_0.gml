button_text = "Place Bet";

action = function()
{
    obj_game.betting = false;
    obj_game.current_chips -= obj_game.current_bet;
    obj_game.previous_bet = obj_game.current_bet;
    audio_play_sound(snd_button_click, 0, false);
}