function fuenteBase()constructor
{
	function mezclarFuente()
	{
		var font_mapping = " !\"#$%&'()*+,-./0123456789:;<=>?@ABCDEFGHIJKLMNOPQRSTUVWXYZ[\\]^_`abcdefghijklmnopqrstuvwxyz{|}~áéíóúÁÉÍÓÚÑñ¡¿";
		myfont = font_add_sprite_ext(spr_font01,font_mapping,true,1);
		return myfont;
	}
	
	function ponerFuente()
	{
		return draw_set_font(myfont);
	}
}