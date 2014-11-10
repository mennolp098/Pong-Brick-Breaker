package game.objects 
{
	import flash.display.DisplayObjectContainer;
	import game.Game;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class Pad 
	{
		private var _yVelocity:Number;
		
		protected var _speed:Number
		
		public var _pad:PadImage;
		
		public function Pad(container:DisplayObjectContainer) 
		{
			_pad = new PadImage();
			container.addChild(_pad);
			_yVelocity = 0;
			_speed = 3;
		}
		public function changeVelocity(velocityY:Number):void
		{
			_yVelocity = velocityY;
		}
		public function update():void
		{
			_pad.y += _yVelocity + _speed;
		}
	}
}