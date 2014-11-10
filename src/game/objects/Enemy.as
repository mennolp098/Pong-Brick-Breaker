package game.objects 
{
	import flash.display.DisplayObjectContainer;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class Enemy extends Pad
	{
		private var _currentBall:Ball;
		public function Enemy(container:DisplayObjectContainer, ball:Ball) 
		{
			super(container);
			pad.x = 600;
			_currentBall = ball;
		}
		override public function update():void 
		{
			super.update();
			var ballY:Number = _currentBall.object.y;
			if (pad.y+10 < ballY)
			{
				_yVelocity = 1;
			} else if(pad.y-10 > ballY) {
				_yVelocity = -1;
			} else {
				_yVelocity = 0;
			}
		}
	}
}