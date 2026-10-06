draw_self();

image_xscale = 2; 
image_yscale = 2;

image_alpha = 1;

if (card_data.face_up)
{
    sprite_index = spr_card_front
}
else 
{
	sprite_index = spr_card_back;
}

if (card_data.face_up)
{
    draw_set_color(c_black);
    
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    draw_sprite_ext(spr_card_suits, suit, x, y, 2, 2, 0, c_white, 1);
    
    var _xoffset = 26;
    var _yoffset = 42;
    
    draw_sprite_ext(spr_card_values, sprite, x - _xoffset, y - _yoffset, 2, 2, 0, c_white, 1);
    draw_sprite_ext(spr_card_values, sprite, x + _xoffset, y + _yoffset, 2, 2, 180, c_white, 1);
    
    //draw_text(x, y - 72, $"{suits[suit]}\n{values[sprite]}");
}