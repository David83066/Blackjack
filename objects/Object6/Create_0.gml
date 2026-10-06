function player_get_card()
{
    var _deck_size = array_length(obj_game.deck) - 1;
    var _player_hand = array_length(obj_game.player_hand)
    var _cardX = (_player_hand * 80) + 148;
    var _cardY = 276;
    var _card = obj_game.deck[_deck_size];
    
    instance_create_depth(_cardX, _cardY, - _player_hand, obj_card, _card);
    
    array_push(obj_game.player_hand, _card);
    array_delete(obj_game.deck, _deck_size, 1);
}

function dealer_get_card()
{
    var _deck_size = array_length(obj_game.deck) - 1;
    var _dealer_hand = array_length(obj_game.dealer_hand);
    var _cardX = (_dealer_hand * 80) + 148;
    var _cardY = 96;
    var _card = obj_game.deck[_deck_size];
    
    instance_create_depth(_cardX, _cardY, - _dealer_hand, obj_card, _card)
    
    array_push(obj_game.dealer_hand, _card);
    array_delete(obj_game.deck, _deck_size, 1);
}

function get_hand_value(_hand, _hand_size)
{ 
    var _hand_val = 0;
    for (i = 0; i < _hand_size; i++)
    {
        var _val = _hand[i].sprite;
       
        if (_val >= 9 and _val <= 12)
        {
            _hand_val += 10;
        }
         else if (_val == 0 and (_hand_val + 11) <= 21)
        {
            _hand_val += 11;
        }
        else if(_val >= 0 and _val <= 8)
        {
            _hand_val += _val + 1;
        }
    }
    return _hand_val;
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

if (keyboard_check_pressed(vk_tab))
{
    var _full = window_get_fullscreen();
    window_set_fullscreen(!_full);
}

if (keyboard_check_pressed(vk_enter))
{
    game_restart();
}

if (keyboard_check_pressed(vk_shift))
{
    show_debug_message($"player: {player_hand_size}, {player_hand_value}\n {player_hand}");
    show_debug_message($"dealer: {dealer_hand_size}, {dealer_hand_value}\n {dealer_hand}");
}

if (keyboard_check_pressed(vk_control))
{
    show_debug_message(array_length(deck));
    show_debug_message(deck);
}

if (keyboard_check_pressed(vk_space))
{
    randomize();
    array_shuffle_ext(deck);
}

if (keyboard_check_pressed(ord("P")))
{
    get_card(player_hand, player_y, true);
}

if (keyboard_check_pressed(ord("D")))
{
    get_card(dealer_hand, dealer_y, true);
}

if (keyboard_check_pressed(ord("N")))
{
    round_restart();
}

if (keyboard_check_pressed(ord("Q")))
{
    show_debug_message(global.game_state);
    show_debug_message(global.round_result);
}

if (keyboard_check_pressed(ord("W")))
{
    global.round_result = Round_Result.player_win;
}