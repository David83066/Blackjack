enum Game_State
{
    round_start,
    betting,
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
    
    obj_game.current_bet = 0;
    global.chips = 0;
    
    deal_step = 0;
    
    global.round_result = Round_Result.none;
    
    global.game_state = Game_State.betting;
    obj_game.betting = true;
}

function start_round()
{
    global.game_state = Game_State.dealing;
    
    deal_next_card();
}

function deal_next_card()
{
    switch (deal_step)
    {
        case 0:
            get_card(player_hand, player_y, false)
            break
        
        case 1:
            flip_card(player_hand, 0)
            break
        
        case 2:
            get_card(dealer_hand, dealer_y, false)
            break
        
        case 3:
            flip_card(dealer_hand, 0)
            break
        
        case 4:
            get_card(player_hand, player_y, false)
            break
        
        case 5:
            flip_card(player_hand, 1)
            break
        
        case 6:
            get_card(dealer_hand, dealer_y, false)
            break
        
        case 7:
            check_blackjack()
            break
    }
    
    if (deal_step < 7)
    {
        alarm[1] = 30;
    }
}

function check_blackjack()
{
    if (get_hand_value(player_hand) == 21)
    {
        flip_card(dealer_hand, 1);
        show_debug_message("blackjack");
        
        if (get_hand_value(dealer_hand) == 21)
        {
            show_debug_message("push");
            global.round_result = Round_Result.push;
            push();
            alarm[3] = 45;
        }
        else
        {
            show_debug_message("win");
            global.round_result = Round_Result.blackjack;
            player_blackjack();
            alarm[3] = 45;
        }
    }
    else if (get_hand_value(dealer_hand) == 21)
    {
        flip_card(dealer_hand, 1);
        show_debug_message("dealer blackjack\nlose");
        global.round_result = Round_Result.dealer_win;
        alarm[3] = 45;
    }
    else 
    {
        global.game_state = Game_State.player_turn;
    }
}

function dealer_turn()
{
    if (dealer_hand[dealer_hand_size - 1].face_up == false)
    {
        var _to_flip = dealer_hand_size - 1;
        flip_card(dealer_hand, _to_flip);
        alarm[2] = 30;
    }
    else if (dealer_hand_value > 21)
    {
        show_debug_message("dealer bust");
        global.round_result = Round_Result.player_win;
        player_win();
        alarm[3] = 45;
    }
    else if (dealer_hand_value < 17)
    {
        get_card(dealer_hand, dealer_y, false)
        alarm[2] = 30;
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
        global.round_result = Round_Result.push;
        push();
        alarm[3] = 45;
    }
    else if (_player > _dealer)
    {
        show_debug_message("win")
        global.round_result = Round_Result.player_win;
        player_win();
        alarm[3] = 45;
    }
    else if (_dealer > _player)
    {
        show_debug_message("lose")
        global.round_result = Round_Result.dealer_win;
        alarm[3] = 45;
    }
}

enum Round_Result
{
    none,
    player_win,
    dealer_win,
    push,
    bust,
    blackjack
}