package game.objects.pads 
{
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import flash.events.EventDispatcher;
	import game.Game;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class Pad extends EventDispatcher
	{
		public static const FIREBALL:String = "fireBall";
		
		protected var _yVelocity:Number;
		public var speed:Number
		
		public var pad:PadImage;
		
		public function Pad(container:DisplayObjectContainer) 
		{
			pad = new PadImage();
			container.addChild(pad);
			pad.y = 300;
			_yVelocity = 0;
			speed = 5;
			pad.gotoAndStop(1);
		}
		public function update():void
		{
			pad.y += _yVelocity * speed;
		}
	}
}