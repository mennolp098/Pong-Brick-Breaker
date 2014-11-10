package game.objects 
{
	import flash.display.Sprite;
	import flash.display.DisplayObjectContainer;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class Ball extends Sprite
	{
		public var SpeedX:int;
		public var SpeedY:int;
		private var _ball:ballImage;
		public function Ball(container:DisplayObjectContainer) 
		{
			_ball = new ballImage();
			container.addChild(_ball);
		}
		public function update():void
		{
			this.x += SpeedX;
			this.y += SpeedY;
		}
	}

}