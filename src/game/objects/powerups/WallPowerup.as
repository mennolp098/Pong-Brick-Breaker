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
			super(id);
			powerupImage = new PowerupImageWall();
			addChild(powerupImage);
		}
		override public function sendPower(container:Game):void
		{
			super.sendPower(container);
			var wall:WallImage = new WallImage();
			if (powerupId == 0)
			{
				container.addChild(wall);
				wall.x = 200;
			} else {
				wall.x = 600;
			}
		}
	}
}