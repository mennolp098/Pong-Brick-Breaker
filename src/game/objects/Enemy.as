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
			_currentBall = ball;
		}
		override public function update():void 
		{
			super.update();
			/*var ballY:Number = _currentBall.ball.y;
			if (pad.y < ballY)
			{
				_yVelocity = 1;
			} else if(pad.y > ballY) {
				_yVelocity = -1;
			} else {
				_yVelocity = 0;
			}
			*/
		}
	}
}