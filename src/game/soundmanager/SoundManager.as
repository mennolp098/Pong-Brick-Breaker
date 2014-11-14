package game.soundmanager 
{
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import flash.net.URLRequest;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class SoundManager 
	{
		public static const SOUND_BOINK : String	=	"soundBoink";
		public static const SOUND_BOINK2 : String	=	"soundBoink2";
		public static const SOUND_VICTORY : String	=	"soundVictory";
		public static const SOUND_CLICK : String	=	"soundClick"; 
		public static const SOUND_POWERUP : String	=	"soundPowerup";
		public static const SOUND_DESTROY : String	=	"soundDestroy";
		
		public static var soundChannel:SoundChannel;
		public function SoundManager() 
		{
			soundChannel = new SoundChannel();
		}
		public static function playSound(sound:String):void
		{
			var soundToPlay:Sound;
			var boinkReq:URLRequest = new URLRequest("sounds/boink.mp3"); 
			var boink2Req:URLRequest = new URLRequest("sounds/boink2.mp3");
			var victoryReq:URLRequest = new URLRequest("sounds/drumroll_victory.mp3");
			var clickReq:URLRequest = new URLRequest("sounds/menuclick.mp3");
			var powerupReq:URLRequest = new URLRequest("sounds/powerupz.mp3");
			var destroyReq:URLRequest = new URLRequest("sounds/tabledestroy.mp3");
			
			if (sound == SOUND_BOINK)
			{
				soundToPlay = new Sound(boinkReq);
			} 
			else if (sound == SOUND_BOINK2)
			{
				soundToPlay = new Sound(boink2Req);
			}
			else if (sound == SOUND_CLICK)
			{
				soundToPlay = new Sound(clickReq);
			}
			else if (sound == SOUND_DESTROY)
			{
				soundToPlay = new Sound(destroyReq);
			}
			else if (sound == SOUND_POWERUP)
			{
				soundToPlay = new Sound(powerupReq);
			}
			else if (sound == SOUND_VICTORY)
			{
				soundToPlay = new Sound(victoryReq);
			}
			soundChannel = soundToPlay.play();
		}
	}
}