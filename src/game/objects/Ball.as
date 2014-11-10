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
		public var SpeedX:int = -4;
		public var SpeedY:int;
		public var Image:ballImage;
		public function Ball(container:DisplayObjectContainer) 
		{
			Image = new ballImage();
			container.addChild(Image);
		}
		public function update(container:DisplayObjectContainer):void
		{
			Image.x += SpeedX;
			Image.y += SpeedY;
			if (Image.y >= container.stage.stageHeight)
			{
				SpeedY *= -1;
			}
			if (Image.y <= 0)
			{
				SpeedY *= -1;
			}
		}
	}

}