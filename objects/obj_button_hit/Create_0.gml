button_text = "Hit";

next_card = true;

function action()
{
    if (next_card == true)
    {
        get_card(obj_game.player_hand, obj_game.player_y, false);
        next_card = false;
        alarm[0] = 30;
    }
    
}