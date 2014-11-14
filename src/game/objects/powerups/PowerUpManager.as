package game.objects.powerups 
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class PowerUpManager
	{
		public function generatePowerUp(id:Number, powerupArray:Array, container:DisplayObjectContainer, spawnPos:Point):void
		{
			// TODO: send a powerup 
			var powerup:Powerup;
			switch(Math.random() * 4) {
				case 0:
					
					break;
				case 1:
					break;
				case 2:
					break;
				case 3:
					break;
				default:
					break;
			}
			container.addChild(powerup);
			powerup.x = spawnPos.x;
			powerup.y = spawnPos.y;
			powerupArray.push(powerup);
		}
	}
}