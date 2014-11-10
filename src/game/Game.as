package game 
{
	import flash.display.Sprite;
	import game.objects.Enemy;
	import game.objects.Ball;
	import game.objects.Pad;
	import game.objects.Player;
	import flash.events.Event;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class Game extends Sprite
	{
		private var _player01:Player;
		private var _enemy:Enemy;
		private var _ball:Ball;
		public function Game() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_player01 = new Player(this, false);
			_enemy = new Enemy(this);
			_ball = new Ball(this);
			_ball.Image.x = stage.stageWidth / 2;
			_ball.Image.y = stage.stageHeight / 2;
			
			stage.addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{
			_ball.update(this);
			_player01.update();
			_enemy.update();
			
			
			if(_ball.Image.hitTestObject(_player01.pad))
			{
				
				if( _ball.SpeedX < 0)
				{
					trace("hi");
					_ball.SpeedX *= -1;
					_ball.SpeedY = BallAngle(_player01);
				}
			}
			if(_ball.Image.hitTestObject(_enemy.pad))
			{
				if(_ball.SpeedX > 0)
				{
					_ball.SpeedX *= -1;
					_ball.SpeedY = BallAngle(_enemy);
				}
			}
			
		}
		private function BallAngle(paddel:Pad):Number
		{
			
			var angel :Number = _ball.Image.height/2 * ( (_ball.Image.y-paddel.pad.y) / paddel.pad.height / 2 );
			return angel;
			
		}
		
	}

}