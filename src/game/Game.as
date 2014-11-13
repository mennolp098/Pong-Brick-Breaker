package game 
{
	import flash.display.Sprite;
	import game.objects.pads.Enemy;
	import game.objects.obstacles.ObstacleManager;
	import game.objects.ball.Ball;
	import game.objects.pads.Pad;
	import game.objects.pads.Player;
	import flash.events.Event;
	import game.objects.powerups.PowerUpManager;
	import game.objects.obstacles.Obstacle;
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
		private var _enemyObstacles:Array;
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
			_enemyObstacles = [];
			_player01 = new Player(this);
			_obstacleManager = new ObstacleManager();
			
			_player01Obstacles = _obstacleManager.spawnObstacles(this, 10, 1);
			_enemyObstacles = _obstacleManager.spawnObstacles(this, 660, 0);
			
			_ball = new Ball(this, _player01);
			_ball.object.x = stage.stageWidth / 2;
			_ball.object.y = stage.stageHeight / 2;

			_enemy = new Enemy(this, _ball);
			
			stage.addEventListener(Event.ENTER_FRAME, update);
			_player01.addEventListener(Pad.FIREBALL, fireBall);
			_enemy.addEventListener(Pad.FIREBALL, fireBall);
		}
		
		private function fireBall(e:Event):void 
		{
			if (e.currentTarget == _player01) {
				_ball.fireBall("player");
			} else {
				_ball.fireBall("enemy");
			}
		}
		private function update(e:Event):void 
		{
			_ball.update(this);
			_player01.update();
			_enemy.update();
			padCollision();
			obstacleCollision(_player01Obstacles);
			obstacleCollision(_enemyObstacles);
		}
		private function obstacleCollision(_currentArray:Array):void
		{
			var l:int = _currentArray.length;
			var spawnPos:Array;
			var whoCanFire:String;
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
					
					if (_currentArray == _enemyObstacles)
					{
						spawnPos = [_enemy.pad.x, _enemy.pad.y];
						whoCanFire = "enemy";
					} else {
						spawnPos = [_player01.pad.x, _player01.pad.y];
						whoCanFire = "player";
					}
					_ball.die(this,spawnPos[0],spawnPos[1],whoCanFire);
				}
			}
		}
		private function padCollision():void
		{
			if(_ball.object.hitTestObject(_player01.pad))
			{
				if( _ball.speedX < 0 && _player01.pad.currentFrame == 1)
				{
					_ball.speedX *= -1;
					_ball.speedY = BallAngle(_player01);
				}
			}
			if(_ball.object.hitTestObject(_enemy.pad))
			{
				if(_ball.speedX > 0 && _enemy.pad.currentFrame == 1)
				{
					_ball.speedX *= -1;
					_ball.speedY = BallAngle(_enemy);
				}
			}
		}
		private function BallAngle(paddel:Pad):Number
		{
			
			var angel :Number = (_ball.object.height / 2 * ( (_ball.object.y - paddel.pad.y) / paddel.pad.height / 2 ) * 1.5);
			return angel;
			
		}
		
	}

}