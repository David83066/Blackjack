
function deck_refill()
{
   for (suit_i = 0; suit_i < 4; suit_i++)
   {
       for (spr_i = 0; spr_i < 13; spr_i++)
       {
           card = {suit : suit_i, sprite : spr_i}
           array_push(deck, card);
       }
   }
    array_shuffle_ext(deck)
}

function get_card(_hand, _y, _face_up)
{
    var _deck_size = array_length(obj_game.deck) - 1;
    var _hand_size = array_length(_hand);
    var _cardX = (_hand_size * 80) + 148;
    var _cardY = _y;
    var _card = obj_game.deck[_deck_size];
    
    _card.face_up = _face_up;
    
    audio_play_sound(snd_card_deal, 0, false);
    
    var _new_card = instance_create_depth(_cardX, _cardY, - _hand_size, obj_card, _card);
    
    _new_card.card_data = _card;
    
    array_push(_hand, _card);
    array_delete(obj_game.deck, _deck_size, 1);
}

function get_hand_value(_hand)
{ 
    var _hand_size = array_length(_hand);
    var _hand_val = 0;
    var _ace = false;
    
    for (i = 0; i < _hand_size; i++)
    {
        var _val = _hand[i].sprite;
       
        if (_val >= 9 and _val <= 12)
        {
            _hand_val += 10;
        }
         else if (_val == 0 and _ace == false)
        {
            _ace = true;
            _hand_val += 1;
        }
        else if(_val >= 0 and _val <= 8)
        {
            _hand_val += _val + 1;
        }
    }
    
    if (_ace == true and (_hand_val + 10) <= 21)
    {
        _hand_val += 10;
    }
    
    return _hand_val;
}

function flip_card(_hand, _card)
{
    audio_play_sound(snd_card_flip, 0, false);
    _hand[_card].face_up = true;
}

function get_shown_value(_hand)
{
    var _hand_size = array_length(_hand);
    var _hand_val = 0;
    var _ace = false;
    
    for (i = 0; i < _hand_size; i++)
    {
        var _val = _hand[i].sprite;
        {
            if (_hand[i].face_up)
            {
                if (_val >= 9 and _val <= 12)
                {
                    _hand_val += 10;
                }
                else if (_val == 0 and _ace == false)
                {
                    _ace = true;
                    _hand_val += 1;
                }
                else if (_val >= 0 and _val <= 8)
                {
                    _hand_val += _val + 1;
                }
            }
        }
    }
    
    if (_ace == true and (_hand_val + 10) <= 21) 
    { 
        _hand_val += 10;
    }
    
    return _hand_val;
}

function player_win()
{
    global.chips = obj_game.current_bet * 2;
    obj_game.current_chips += global.chips;
}

function push()
{
    global.chips = obj_game.current_bet;
    obj_game.current_chips += global.chips;
}

function player_blackjack()
{
    global.chips = ceil(obj_game.current_bet * 2.5);
    obj_game.current_chips += global.chips;
}