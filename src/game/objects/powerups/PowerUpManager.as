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
		public function generatePowerUp(id:Number, container:DisplayObjectContainer, spawnPos:Point):Powerup
		{
			// TODO: send a powerup 
			var powerup:Powerup;
			var random:int = Math.random() * 4;
			switch(random) {
				case 0:
					powerup = new WallPowerup(id);
					break;
				case 1:
					powerup = new SpeedPowerup(id);
					break;
				case 2:
					powerup = new BallSpeedPowerup(id);
					break;
				case 3:
					powerup = new ShortenOtherPlayerPowerup(id);
					break;
				default:
					powerup = new WallPowerup(id);
					break;
			}
			container.addChild(powerup);
			powerup.x = spawnPos.x;
			powerup.y = spawnPos.y;
			return powerup;
		}
	}
}