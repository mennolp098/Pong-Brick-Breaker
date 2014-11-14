package game.objects.pads 
{
	import flash.display.DisplayObjectContainer;
	import flash.events.Event;
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
			pad = new player02();
			container.addChild(pad);
			super(container);
			pad.x = 600;
			_currentBall = ball;
			pad.scaleX = -1;
		}
		override public function update():void 
		{
			super.update();
			var ballY:Number = _currentBall.object.y;
			var ballX:Number = _currentBall.object.x;
			if (ballY >= pad.y-20 && ballY <= pad.y+20 && ballX == pad.x)
			{
				dispatchEvent(new Event(Pad.FIREBALL, true));
			}
			if (ballX > 400)
			{
				if (pad.y+40 < ballY)
				{
					if (_yVelocity <= 1)
					{
						_yVelocity += 0.1;
						pad.gotoAndStop(5);
					}
				} 
				else if (pad.y - 40 > ballY) 
				{
					if (_yVelocity >= -1)
					{
						_yVelocity -= 0.1;
						pad.gotoAndStop(4);
					}
				} else {
					pad.gotoAndStop(1);
				}
			} else {
				if (_yVelocity > 0) 
				{
					_yVelocity -= 0.1;
				}
				else if (_yVelocity < 0) 
				{
					_yVelocity += 0.1;
				} else {
					pad.gotoAndStop(1);
				}
			}
		}
	}
}