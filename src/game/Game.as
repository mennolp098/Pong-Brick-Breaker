package game 
{
	import flash.display.Sprite;
	import game.objects.Ball;
	import game.objects.Player;
	import flash.events.Event;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class Game extends Sprite
	{
		private var _ball:Ball;
		public function Game() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_ball = new Ball(this);
			
			stage.addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{
			
			if(_ball.hitTestObject(Paddle1))
			{
				if( _ball.SpeedX> 0)
				{
					ball.volasity *= -1;
				}
			}
			if(_ball.hitTestObject(Paddle2))
			{
				if(_ball.SpeedX > 0)
				{
					_ball.volasity *= -1;
				}
			}
			
		}
		private function BallAngle():Number
		{
			
			var angel :Number = half _ball width * ( (_ball.y-paddleY) / half paddel width );
			return angel;
			
			
		}
		
	}

}