if (keyboard_check(vk_escape))
{
    game_end();
}

if (array_length(deck) == 0)
{
    deck_refill(); 
}

player_hand_size = array_length(player_hand);
player_hand_value = get_hand_value(player_hand);

dealer_hand_size = array_length(dealer_hand);
dealer_hand_value = get_hand_value(dealer_hand);

if (global.game_state == Game_State.round_start)
{
    round_restart();
}

if (betting == false and global.game_state == Game_State.betting)
{
    start_round();
}

if (global.game_state == Game_State.player_turn and player_hand_value == 21)
{
    global.game_state = Game_State.dealer_turn;
    alarm[2] = 60;
}

if (global.game_state == Game_State.player_turn and player_hand_value > 21)
{
    global.game_state = Game_State.round_end;
    alarm[3] = 75;
    alarm[4] = 45;
}