package game.objects.powerups 
{
	import flash.display.DisplayObjectContainer;
	import game.Game;
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
		override public function sendPower(container:Game):void
		{
			super.sendPower(container);
			if (powerupId == 0)
			{
				container.enemy.speed = 0.5;
			} else {
				container.player01.speed = 0.5;
			}
		}
	}
}