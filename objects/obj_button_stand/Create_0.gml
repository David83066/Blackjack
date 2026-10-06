button_text = "Stand";

action = function()
{
    global.game_state = Game_State.dealer_turn;
    obj_game.alarm[2] = 30;
}