package game.objects.powerups 
{
	import flash.display.DisplayObjectContainer;
	import game.Game;
	import game.objects.pads.Enemy;
	import game.objects.pads.Player;
	import flash.utils.setTimeout;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class ShortenOtherPlayerPowerup extends Powerup
	{
		private var _enemy:Enemy;
		private var _player:Player;
		public function ShortenOtherPlayerPowerup(id:int) 
		{
			powerupImage = new PowerupImageShort();
			addChild(powerupImage);
			super(id);
		}
		override public function sendPower(container:Game):void
		{
			super.sendPower(container);
			_player = container.player01;
			_enemy = container.enemy;
			if (powerupId == 0)
			{
				_enemy.pad.scaleY = 0.5;
			} else {
				_player.pad.scaleY = 0.5;
			}
			setTimeout(changeBack, 5000);
		}
		private function changeBack():void
		{
			if (powerupId == 0)
			{
				_enemy.pad.scaleY = 1;
			} else {
				_player.pad.scaleY = 1;
			}
		}
	}
}