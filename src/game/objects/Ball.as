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
		public var speed:int = 1;
		public var speedX:int = -6;
		public var speedY:int;
		public var object:ballImage;
		public function Ball(container:DisplayObjectContainer) 
		{
			object = new ballImage();
			container.addChild(object);
		}
		public function update(container:DisplayObjectContainer):void
		{
			object.x += speedX * speed;
			object.y += speedY* speed;
			if (object.y >= container.stage.stageHeight)
			{
				speedY *= -1;
			}
			if (object.y <= 0)
			{
				speedY *= -1;
			}
		}
	}

}