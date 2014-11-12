package game.objects.pads 
{
	import flash.display.DisplayObjectContainer;
	import game.objects.ball.Ball;
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
			var ballX:Number = _currentBall.object.x;
			if (ballX > 400)
			{
				if (pad.y+20 < ballY)
				{
					if (_yVelocity <= 1)
					{
						_yVelocity += 0.1;
					}
				} 
				else if (pad.y - 20 > ballY) 
				{
					if (_yVelocity >= -1)
					{
						_yVelocity -= 0.1;
					}
				}
			} else {
				if (_yVelocity > 0) 
				{
					_yVelocity -= 0.1;
				}
				else if (_yVelocity < 0) 
				{
				_yVelocity += 0.1;
				}
			}
		}
	}
}