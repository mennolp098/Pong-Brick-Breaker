package game 
{
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class Game extends Sprite
	{
		
		public function Game() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			stage.addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{
			/*
			if(ball.hitTestObject(Paddle1))
			{
				if(ballSpeedX > 0)
				{
					ball.volasity *= -1;
				}
			}
			if(ball.hitTestObject(Paddle2))
			{
				if(ballSpeedX > 0)
				{
					ball.volasity *= -1;
				}
			}
			*/
		}
		
	}

}