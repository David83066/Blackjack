if (global.game_state == Game_State.dealing)
{
    image_alpha = 1;
}

if (obj_game.player_hand_size <= 2) and (obj_game.current_bet  <= obj_game.current_chips)
{
    button_available = true;
}
else
{
    button_available = false;
}

if (button_available == false)
{
    image_alpha = 0.6;
}