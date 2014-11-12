package game.objects.pads 
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import game.Game;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class Pad
	{
		protected var _yVelocity:Number;
		
		protected var _speed:Number
		
		public var pad:PadImage;
		
		public function Pad(container:DisplayObjectContainer) 
		{
			pad = new PadImage();
			container.addChild(pad);
			pad.y = 300;
			_yVelocity = 0;
			_speed = 5;
		}
		public function update():void
		{
			pad.y += _yVelocity * _speed;
		}
	}
}