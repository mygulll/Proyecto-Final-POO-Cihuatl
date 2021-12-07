function cajaTextoDINAMICA(_array,_pos)constructor
{
	self.atlas = spr_textBox;
	self.origen = new vector(_pos.getX(),_pos.getY())
	self.array = _array;
	self.texto = new print(1,array,origen,300);
	
	self.status = true;
	
	function setTexto(_arreglo) {self.array = _arreglo; texto.setStr(_arreglo);}
	function setPos(_origen) {self.origen = _origen; texto.setFrom(self.origen)}
	
	
	
	function crear()
	{
		texto.empezarVariables();
	}
	
	function paso()
	{
		if (status == true)
		{
			texto.actualizarVariables();
		}
	}
	
	function dibujar()
	{
		if (status == true)
		{
			var atlassize = sprite_get_width(atlas);
			var proportionY = floor(string_height(array[0])/atlassize);
			var proportionX = floor(string_width(array[0])/atlassize)+1;
			var i;
			for(i=0;i<proportionY;i++)
			{
				draw_sprite(atlas,3,origen.getX()-atlassize,origen.getY()+atlassize*i);
				draw_sprite(atlas,5,origen.getX()+proportionX*atlassize,origen.getY()+atlassize*i);
				for (j=0;j<proportionX;j++)
				{
					draw_sprite(atlas,4,origen.getX()+atlassize*j,origen.getY()+atlassize*i);
				}
			}
		
			for(i=0;i<proportionX;i++)
			{
				draw_sprite(atlas,1,origen.getX()+atlassize*i,origen.getY()-atlassize);
				draw_sprite(atlas,7,origen.getX()+atlassize*i,origen.getY()+atlassize*proportionY);
			}
			draw_sprite(atlas,0,origen.getX()-atlassize,origen.getY()-atlassize);
			draw_sprite(atlas,2,origen.getX()+proportionX*atlassize,origen.getY()-atlassize);
			draw_sprite(atlas,6,origen.getX()-atlassize,origen.getY()+proportionY*atlassize);
			draw_sprite(atlas,8,origen.getX()+proportionX*atlassize,origen.getY()+proportionY*atlassize);
			texto.imprimirTexto();
		}
	}
	function desactivar()
	{
		status = false;
	}
	function getStatus()
	{
		return status;
	}
}