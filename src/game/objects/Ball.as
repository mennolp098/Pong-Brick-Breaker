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
		public var SpeedX:int = -6;
		public var SpeedY:int;
		public var object:ballImage;
		public function Ball(container:DisplayObjectContainer) 
		{
			object = new ballImage();
			container.addChild(object);
		}
		public function update(container:DisplayObjectContainer):void
		{
			object.x += SpeedX;
			object.y += SpeedY;
			if (object.y >= container.stage.stageHeight)
			{
				SpeedY *= -1;
			}
			if (object.y <= 0)
			{
				SpeedY *= -1;
			}
		}
	}

}