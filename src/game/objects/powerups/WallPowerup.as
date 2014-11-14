package game.objects.powerups 
{
	import flash.display.DisplayObjectContainer;
	import game.Game;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class WallPowerup extends Powerup
	{
		
		public function WallPowerup(id:int) 
		{
			powerupImage = new PowerupImageWall();
			addChild(powerupImage);
			super(id);
		}
		override public function sendPower(container:Game):void
		{
			super.sendPower(container);
			if (powerupId == 0)
			{
				container.createWall(200);
			} else {
				container.createWall(600);
			}
		}
	}
}