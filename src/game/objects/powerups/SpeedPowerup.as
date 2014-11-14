package game.objects.powerups 
{
	import flash.display.DisplayObjectContainer;
	import game.Game;
	import flash.utils.setTimeout;
	import game.objects.pads.Enemy;
	import game.objects.pads.Player;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class SpeedPowerup extends Powerup
	{
		private var _enemy:Enemy;
		private var _player:Player;
		public function SpeedPowerup(id:int) 
		{
			powerupImage = new PowerupImageFast();
			addChild(powerupImage);
			super(id);
		}
		override public function sendPower(container:Game):void
		{
			super.sendPower(container);
			_player = container.player01;
			_enemy = container.enemy;
			if (powerupId == 1)
			{
				_player.speed /= 2;
			} else {
				_enemy.speed /= 2;
			}
			setTimeout(changeBack, 5000);
		}
		private function changeBack():void
		{
			if (powerupId == 1)
			{
				_player.speed *= 2;
			} else {
				_enemy.speed *= 2;
			}
		}
	}
}