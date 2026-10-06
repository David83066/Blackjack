draw_set_halign(fa_center);
draw_set_valign(fa_middle);

draw_set_font(fnt_button);
draw_set_color(c_white);

draw_set_font(fnt_tekst)

var _x = room_width / 2;
var _y = room_height / 2;

var _result = "";
var _chips = 0;
var _text = "";

switch (global.round_result)
{
    case Round_Result.none:
        _result = "";
        _text = $"Bet: {current_bet}";
        break;
    
    case Round_Result.player_win:
        _result = "You Win"
        _text = $"          + {global.chips}";
        break;
    
    case Round_Result.dealer_win:
        _result = "Dealer Wins"
        _text = "Bet: 0";
        break;
    
    case Round_Result.push:
        _result = "Push"
        _text = $"          + {global.chips}";
        break;
    
    case Round_Result.bust:
        _result = "Bust"
        _text = "Bet: 0";
        break
    
    case Round_Result.blackjack:
        _result = "Blackjack"
        _text = $"          + {global.chips}";
        break
}

draw_text_transformed(_x, _y, _result, 3, 3, 0);

if (get_shown_value(dealer_hand) != 0)
{
    var _dealer_shown_value = get_shown_value(dealer_hand);
    draw_text(64, 48, _dealer_shown_value);
}

if (get_shown_value(player_hand) != 0)
{
    var _player_shown_value = get_shown_value(player_hand);
    draw_text(64, 226, _player_shown_value);
}

draw_set_halign(fa_left);
var _betX = 42;

draw_text(_betX, _y - 16, $"Chips: {current_chips}");
draw_text(_betX, _y + 16, _text);
