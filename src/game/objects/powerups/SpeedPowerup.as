package game.objects.powerups 
{
	import flash.display.DisplayObjectContainer;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class SpeedPowerup extends Powerup
	{
		
		public function SpeedPowerup(id:int) 
		{
			super(id);
			powerupImage = new PowerupImageFast();
			addChild(powerupImage);
		}
		override public function sendPower(container:DisplayObjectContainer)
		{
			
		}
	}
}