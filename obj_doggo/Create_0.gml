facing = 1;
en_el_aire = false;

player_sprites = [spr_doggoIdle,//0
					spr_doggoRunning,//1
					spr_doggoIdle,//2
					spr_doggoIdle,//3
					spr_doggoIdle,//4
					spr_doggoIdle,//6
					spr_doggoIdle,//7
					spr_doggoIdle,//8
					spr_doggoIdle,//9
					spr_doggoIdle,//10
					spr_doggoIdle,//11
					spr_doggoIdle,//12
					spr_chupacabra//13
					]
sprites_index = 0;


subimage_counter = 0;

PHY_haccel = 0;
PHY_vspeed = 0;
PHY_hspeed = 0;

serAplastado = false;

player = new enemy(self,2);
player.create();




mostrarTexto = false;
texto = ["¡No me regreses!\nTexto de prueba"]

textoRANDOM = [["El hombre búho nos dejara salir nuevamente"],["Es más fuerte en la noche, debemos de hacer tiempo"],["El señor de la noche se acerca"]];