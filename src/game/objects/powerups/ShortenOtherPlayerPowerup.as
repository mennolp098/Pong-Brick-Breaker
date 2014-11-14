package game.objects.powerups 
{
	import flash.display.DisplayObjectContainer;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class ShortenOtherPlayerPowerup extends Powerup
	{
		
		public function ShortenOtherPlayerPowerup(id:int) 
		{
			super(id);
			powerupImage = new PowerupImageShort();
			addChild(powerupImage);
		}
		override public function sendPower(container:DisplayObjectContainer)
		{
			
		}
	}

}