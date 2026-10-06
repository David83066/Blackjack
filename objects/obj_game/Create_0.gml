window_set_fullscreen(true);

randomize();

deck = [];

deck_refill();

player_hand = [];
player_hand_size = 0;
player_hand_value = 0;
player_y = 276;

dealer_hand = [];
dealer_hand_size = 0;
dealer_hand_value = 0;
dealer_y = 84;

global.game_state = Game_State.round_start;
global.round_result = Round_Result.none;

betting = false;
current_bet = 0;
previous_bet = 0;

current_chips = 500;