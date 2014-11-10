package game 
{
	import flash.display.Sprite;
	import game.objects.Enemy;
	import game.objects.ObstacleManager;
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
		private var _obstacleManager:ObstacleManager;
		private var _allObstacles:Array;
		public function Game() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			_allObstacles = [];
			_player01 = new Player(this, false);
			_obstacleManager = new ObstacleManager();
			
			_allObstacles = _obstacleManager.spawnObstacles(this, 100, 1);
			_allObstacles = _obstacleManager.spawnObstacles(this, 400, 1);
			//_enemy = new Enemy(this,_ball);
			stage.addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{
			_player01.update();
			//_enemy.update(ball.y);
			/*
			if(ball.hitTestObject(_player.pad))
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