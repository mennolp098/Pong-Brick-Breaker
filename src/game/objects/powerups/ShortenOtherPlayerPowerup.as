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
			super(id);
			powerupImage = new PowerupImageShort();
			addChild(powerupImage);
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