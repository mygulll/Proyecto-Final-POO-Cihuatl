// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function libro(array)constructor
{
	self.array = array;
	self.autodestruccion = false;
	text = new print(3,array,new vector(64,16),208);
	
	
	//function setArray(_array){self.}
	function empezarVariables()
	{
		text.empezarVariables();
	}
	
	function actualizarVariables()
	{
		text.actualizarVariables();
	}
	
	function imprimirTexto()
	{
		if (text.getStatus())
		{
			draw_sprite(spr_bookBoss,0,0,0);
		}
		else
		{
			self.autodestruccion = true;
		}
		text.imprimirTexto();
	}
	
	function getAutodestruccion()
	{
		return self.autodestruccion;
	}
}