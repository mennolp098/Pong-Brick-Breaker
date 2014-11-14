package game.objects.powerups 
{
	import flash.display.DisplayObjectContainer;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class BallSpeedPowerup extends Powerup
	{
		
		public function BallSpeedPowerup(id:int) 
		{
			super(id);
			powerupImage = new PowerupImageBall();
			addChild(powerupImage);
		}
		override public function sendPower(container:DisplayObjectContainer)
		{
			
		}
	}

}