package game.objects.powerups 
{
	import flash.display.DisplayObjectContainer;
	import game.Game;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class ShortenOtherPlayerPowerup extends Powerup
	{
		
		public function ShortenOtherPlayerPowerup(id:int) 
		{
			powerupImage = new PowerupImageShort();
			addChild(powerupImage);
			super(id);
		}
		override public function sendPower(container:Game):void
		{
			super.sendPower(container);
			if (powerupId == 0)
			{
				container.enemy.pad.scaleY = 0.5;
			} else {
				container.player01.pad.scaleY = 0.5;
			}
		}
	}

}