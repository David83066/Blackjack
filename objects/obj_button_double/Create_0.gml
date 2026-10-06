button_text = "Double";

button_available = false;

action = function()
{
    if (button_available == true)
    {
        obj_game.current_chips -= obj_game.current_bet;
        obj_game.current_bet += obj_game.current_bet;
        get_card(obj_game.player_hand, obj_game.player_y, false);
        alarm[0] = 30;
        
        if (get_hand_value(obj_game.player_hand) <= 21)
        {
            global.game_state = Game_State.dealer_turn; 
            obj_game.alarm[2] = 60;
        }
        else if (get_hand_value(obj_game.player_hand) > 21)
        {
            global.game_state = Game_State.round_end;
            obj_game.alarm[3] = 75;
            obj_game.alarm[4] = 45;
        }
    }
}