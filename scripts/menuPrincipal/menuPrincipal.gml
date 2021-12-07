function menuPrincipal()constructor
{
	self.secuencia = [spr_titleScreen_credits0,
					  spr_titleScreen_credits1,
					  spr_titleScreen_credits2,
					  spr_titleScreen_transition];
	self.secuenciaINDEX = 0;
	self.timer = 0.1;
	self.stage = 0;
	self.Xadder = 0;
	
	self.alpha = 0;
	self.position = 0;
	
	opciones = ["   Jugar\n   Salir"]
	opciones_funciones = [room_goto,game_end]
	opciones_argumentos = [room_test,-4];
	posicion = new vector(125,100);
	main_menu = new cajaTextoELECCION(opciones,posicion,opciones_funciones,opciones_argumentos);
	
	SFX_blow = new SFX(snd_blow);
	
	main_menu.crear();
	
	function step()
	{
		if stage < 2
		{
			rotation = 0;
			startContador(10,0.05);
		}
		else if (stage == 2)
		{
			goDown(0.025)
		}
		else if (stage == 3)
		{
			mostrarLogo(0.05,120);
		}
		else if (stage == 4)
		{
			mostrarBarras(0.15);
		}
		else if (stage == 5)
		{
			//Menu principal
			menu();
		}
		
		if rotation < 360
		{
			rotation = rotation + 1
		}
		else
		{
			rotation = 0;
		}
		
		
		//DEBUG
		/*if keyboard_check_pressed(vk_enter)
		{
			room_goto(room_test);
		}*/
	}
	
	
	//Metodo auxiliar
	function startContador(finish,ratio)
	{
		if (secuenciaINDEX <= array_length(secuencia)-1)
		{
			if ((timer < finish) && stage == 0)
			{
				timer = lerp(timer,finish,ratio);
				if (timer > 9.90)
				{
					stage = 1;
				}
			}
			else if (((timer >= 0) && stage == 1) && secuenciaINDEX < array_length(secuencia)-1)
			{
				timer = lerp(timer,0,ratio);
				if (timer < 0.10)
				{
					stage = 0;
					if (secuenciaINDEX < array_length(secuencia)-1)
					{
						secuenciaINDEX = secuenciaINDEX + 1;
					}
				}
			}
			else
			{
				timer = 10;
				stage = 2;
				SFX_blow.playSound();
			}
		}
	}
	
	function goDown(spd)
	{
		if (Xadder < 539)
		{
			Xadder = lerp(Xadder,540,spd)
		}
		else
		{
			Xadder = 540;
			stage = 3;
		}
	}
	
	function mostrarLogo(spd,time)
	{
		if (alpha < 0.99)
		{
			alpha = lerp(alpha,1,spd);
			logoWait = -1;
		}
		else
		{
			alpha = 1;
			//stage = 4;
			
			if (logoWait == -1)
			{logoWait = 0;}
			
		}
		
		if (logoWait != -1)
		{
			if (logoWait < time)
			{
				logoWait = logoWait + 1;
			}
			else
			{
				stage = 4;
				logoWait = 0;
			}
		}
		//show_debug_message(logoWait);
	}
	
	function mostrarBarras(spd)
	{
		if (position < 0.99)
		{
			position = lerp(position,1,spd);
		}
		else
		{
			position = 1;
			stage = 5;
		}
	}
	
	function menu()
	{
		main_menu.paso();
	}
	
	
	function drawCreditsBG()
	{
		if (stage < 2)
		{
			draw_sprite_ext(spr_titleScreen_creditsBackground,0,0,0,1,1,0,c_white,1);
		}
	}
	
	function drawCredits()
	{
		draw_sprite_ext(secuencia[secuenciaINDEX],0,0,0-Xadder,1,1,0,c_white,timer/10);
		
		gpu_set_texfilter(true);
			gpu_set_blendmode(bm_add);
				draw_sprite_ext(spr_titleScreen_shiny,0,320/2,40,1,1,rotation,c_white,0.75*alpha);
			gpu_set_blendmode(bm_normal);
		gpu_set_texfilter(false);
		
		
		draw_sprite_ext(spr_gameLogo,0,320/2,30,2-(alpha),2-(alpha),0,c_white,alpha);
		
		
		
		
		var altura = sprite_get_height(spr_titleScreen_blackbar);
		draw_sprite_ext(spr_titleScreen_blackbar,0,0,180-(altura *position),1,1,0,c_white,alpha);
		draw_sprite_ext(spr_titleScreen_blackbar,0,0,-altura + (altura *position),1,1,0,c_white,alpha);
		
		var diferencia = sprite_get_height(spr_titleScreen_mainCredits);
		draw_sprite_ext(spr_titleScreen_mainCredits,0,0,180-(diferencia *position),1,1,0,c_white,alpha);
		
		
		if (stage == 5)
		{
			main_menu.dibujar();
		}
		//draw_text(10,0,string(self.timer) + " " + string(secuenciaINDEX));
	}
}