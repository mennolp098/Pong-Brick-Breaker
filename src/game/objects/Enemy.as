package game.objects 
{
	import flash.display.DisplayObjectContainer;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class Enemy extends Pad
	{
		
		public function Enemy(container:DisplayObjectContainer) 
		{
			super(container);
		}
		override public function update(ballY:Number):void 
		{
			super.update();
			if (pad.y < ballY)
			{
				_yVelocity = 1;
			} else if(pad.y > ballY) {
				_yVelocity = -1;
			} else {
				_yVelocity = 0;
			}
		}
	}
}