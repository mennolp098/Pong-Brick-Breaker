package game 
{
	import flash.display.Sprite;
	import game.objects.Enemy;
	import game.objects.ObstacleManager;
	import game.objects.Ball;
	import game.objects.Pad;
	import game.objects.Player;
	import flash.events.Event;
	import game.objects.PowerUpManager;
	import game.objects.Obstacle;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class Game extends Sprite
	{
		private var _player01:Player;
		private var _enemy:Enemy;
		private var _obstacleManager:ObstacleManager;
		private var _player01Obstacles:Array;
		private var _player02Obstacles:Array;
		private var _ball:Ball;
		public function Game() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			_player01Obstacles = [];
			_player02Obstacles = [];
			_player01 = new Player(this, false);
			_obstacleManager = new ObstacleManager();
			
			_player01Obstacles = _obstacleManager.spawnObstacles(this, 10, 1);
			_player02Obstacles = _obstacleManager.spawnObstacles(this, 660, 0);
			
			_ball = new Ball(this);
			_ball.object.x = stage.stageWidth / 2;
			_ball.object.y = stage.stageHeight / 2;

			_enemy = new Enemy(this, _ball);
			
			stage.addEventListener(Event.ENTER_FRAME, update);
		}
		
		private function update(e:Event):void 
		{
			_ball.update(this);
			_player01.update();
			_enemy.update();
			padCollision();
			obstacleCollision(_player01Obstacles);
			obstacleCollision(_player02Obstacles);
			
		}
		private function obstacleCollision(_currentArray:Array):void
		{
			var l:int = _currentArray.length;
			for (var i:int = l-1; i > 0; i--) 
			{
				if (_ball.object.hitTestObject(_currentArray[i]))
				{
					if (Math.random() * 60 == 1)
					{
						var powerUpManager:PowerUpManager;
						powerUpManager = new PowerUpManager();
						powerUpManager.generatePowerUp(_currentArray[i].powerupId);
					}
					removeChild(_currentArray[i]);
					_currentArray.splice(i, 1);
					_ball.speedX *= -1;
					_ball.speedY  = 0;
				}
			}
		}
		private function padCollision():void
		{
			if(_ball.object.hitTestObject(_player01.pad))
			{
				if( _ball.speedX < 0)
				{
					_ball.speedX *= -1;
					_ball.speedY = BallAngle(_player01);
				}
			}
			if(_ball.object.hitTestObject(_enemy.pad))
			{
				if(_ball.speedX > 0)
				{
					_ball.speedX *= -1;
					_ball.speedY = BallAngle(_enemy);
				}
			}
		}
<<<<<<< HEAD
		private function speedUp(speed:int):void
		{
			if (_ball.speed <= 3)
			{
				_ball.speed += speed;
			}
		}
=======
>>>>>>> origin/master
		private function BallAngle(paddel:Pad):Number
		{
			
			var angel :Number = (_ball.object.height / 2 * ( (_ball.object.y - paddel.pad.y) / paddel.pad.height / 2 ) * 1.5);
			return angel;
			
		}
		
	}

}