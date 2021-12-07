facing = 1;
en_el_aire = false;

player_sprites = [spr_chupacabra,//0
					spr_chupacabra,//1
					spr_chupacabra,//2
					spr_chupacabra,//3
					spr_chupacabra,//4
					spr_chupacabra,//6
					spr_chupacabra,//7
					spr_chupacabra,//8
					spr_chupacabra,//9
					spr_chupacabra,//10
					spr_chupacabra,//11
					spr_chupacabra,//12
					spr_chupacabra//13
					]
sprites_index = 0;


subimage_counter = 0;

PHY_haccel = 0;
PHY_vspeed = 0;
PHY_hspeed = 0;

serAplastado = false;

player = new enemy(self,1.8);
player.create();


mostrarTexto = false;
textoRANDOM = [["Cuidado adelante\nAplica lo aprendido"],["Cuidado adelante\nAplica lo aprendido"],["Cuidado adelante\nAplica lo aprendido"]];