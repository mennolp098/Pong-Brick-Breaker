package game.objects.powerups 
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class PowerUpManager
	{
		public function PowerUpManager() 
		{
			
		}
		public function generatePowerUp(id:Number):void
		{
			trace("powerup send");
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
		}
	}
}