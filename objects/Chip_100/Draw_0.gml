if (global.game_state == Game_State.betting)
{
    draw_self();

    draw_set_font(fnt_button);
    draw_set_color(c_white);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    draw_text_transformed(x, y, chip_value, 0.7, 0.7, 0);
}