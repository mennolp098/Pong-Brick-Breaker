package game.objects.powerups 
{
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import game.Game;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class Powerup extends Sprite
	{
		protected var powerupImage:MovieClip;
		public var powerupId:int;
		private var _speed:Number;
		public function Powerup(id:int) 
		{
			//powerupImage = new Power01();
			//addChild(powerupImage);
			powerupId = id;
			_speed = 3;
		}
		public function update():void
		{
			if (powerupId == 0)
			{
				this.x -= _speed;
			} else {
				this.x += _speed;
			}
		}
		public function sendPower(container:Game):void
		{
			
		}
	}
}