/*

enum Game_State
{
    round_start,
    dealing,
    player_turn,
    dealer_turn,
    round_end
}

function round_restart()
{
    with (obj_card)
    {
        instance_destroy();
    }
    
    player_hand = [];
    dealer_hand = [];
    
    global.round_result = Round_Result.none;
    
    start_round();
}

function start_round()
{
    global.game_state = Game_State.dealing;
    
    deal_step = 0;
    
    deal_next_card();
}

function deal_next_card()
{
    if (deal_step == 0)
    {
        get_card(player_hand, player_y)
    }
    if (deal_step == 1)
    {
        get_card(dealer_hand, dealer_y)
    }
    if (deal_step == 2)
    {
        get_card(player_hand, player_y)
    }
    if (deal_step == 3)
    {
        get_card(dealer_hand, dealer_y)
    }
    
    if (deal_step < 3)
    {
        alarm[1] = 45;
    }
    else
    {
        check_blackjack();
    }
}

function check_blackjack()
{
    if (get_hand_value(player_hand) == 21)
    {
        show_debug_message("blackjack");
        if (get_hand_value(dealer_hand) == 21)
        {
            show_debug_message("push");
            alarm[5] = 45;
        }
        else
        {
            show_debug_message("win");
            alarm[3] = 45;
        }
    }
    else if (get_hand_value(dealer_hand) == 21)
    {
        show_debug_message("dealer blackjack\nlose")
        alarm[4] = 45;
    }
    else 
    {
        global.game_state = Game_State.player_turn;
    }
}

function dealer_turn()
{
    if (dealer_hand_value > 21)
    {
        show_debug_message("dealer bust");
        alarm[3] = 45;
    }
    else if (dealer_hand_value < 17)
    {
        get_card(dealer_hand, dealer_y)
        alarm[2] = 60;
    }
    else
    {
        check_winner();
    }
}

function check_winner()
{
    global.game_state = Game_State.round_end;
    
    var _player = player_hand_value;
    var _dealer = dealer_hand_value;
    
    if (_player == _dealer)
    {
        show_debug_message("push")
        alarm[5] = 45;
    }
    else if (_player > _dealer)
    {
        show_debug_message("win")
        alarm[3] = 45;
    }
    else if (_dealer > _player)
    {
        show_debug_message("lose")
        alarm[4] = 45;
    }
}

enum Round_Result
{
    none,
    player_win,
    dealer_win,
    push,
    bust
}