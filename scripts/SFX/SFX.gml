function SFX(sound)constructor
{
	self.sound = sound;
	
	function getSound()
	{
		return audio_get_name(sound);
	}
	
	function playSound()
	{
		audio_play_sound(sound,0,false);
	}
	
	function killSound()
	{
		audio_stop_sound(sound);
	}
}