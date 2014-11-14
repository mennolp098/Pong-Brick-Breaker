package game 
{
	import flash.display.Sprite;
	import flash.geom.Point;
	import game.objects.pads.Enemy;
	import game.objects.obstacles.ObstacleManager;
	import game.objects.ball.Ball;
	import game.objects.pads.Pad;
	import game.objects.pads.Player;
	import flash.events.Event;
	import game.objects.powerups.PowerUpManager;
	import game.objects.obstacles.Obstacle;
	import game.soundmanager.SoundManager;
	import flash.utils.setTimeout;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class Game extends Sprite
	{
		public var player01:Player;
		public var enemy:Enemy;
		private var _winScreenPlayer01:VictoryImage1;
		private var _winScreenPlayer02:VictoryImage2;
		private var _obstacleManager:ObstacleManager;
		private var _player01Obstacles:Array;
		private var _enemyObstacles:Array;
		private var _powerUpArray:Array;
		private var _wallArray:Array;
		private var _ball:Ball;
		private var _soundManager:SoundManager;
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
			_powerUpArray = [];
			_wallArray = [];
			player01 = new Player(this);
			_obstacleManager = new ObstacleManager();
			_soundManager = new SoundManager();
			_winScreenPlayer01 = new VictoryImage1();
			_winScreenPlayer02 = new VictoryImage2();
			
			_player01Obstacles = _obstacleManager.spawnObstacles(this, 10, 1);
			_enemyObstacles = _obstacleManager.spawnObstacles(this, 660, 0);
			
			_ball = new Ball(this, player01);
			_ball.object.x = stage.stageWidth / 2;
			_ball.object.y = stage.stageHeight / 2;
			
			enemy = new Enemy(this, _ball);
			
			stage.addEventListener(Event.ENTER_FRAME, update);
			player01.addEventListener(Pad.FIREBALL, fireBall);
			enemy.addEventListener(Pad.FIREBALL, fireBall);
			
			addChild(_winScreenPlayer01);
			addChild(_winScreenPlayer02);
			_winScreenPlayer01.visible = false;
			_winScreenPlayer02.visible = false;
		}
		
		private function fireBall(e:Event):void 
		{
			if (e.currentTarget == player01) {
				_ball.fireBall("player");
			} else {
				_ball.fireBall("enemy");
			}
		}
		private function update(e:Event):void 
		{
			_ball.update(this);
			player01.update();
			enemy.update();
			padCollision();
			wallCollision();
			obstacleCollision(_player01Obstacles);
			obstacleCollision(_enemyObstacles);
			updatePowerups();
		}
		public function createWall(newX:Number):void
		{
			var wall:WallImage = new WallImage();
			addChild(wall);
			wall.x = newX;
			wall.y = 300;
			_wallArray.push(wall);
			setTimeout(removeWall, 5000);
		}
		private function removeWall():void
		{
			removeChild(_wallArray[0]);
			_wallArray.splice(0, 1);
		}
		private function wallCollision():void
		{
			var l:int = _wallArray.length;
			for (var i:int = l-1; i >= 0; i--) 
			{
				if (_ball.object.hitTestObject(_wallArray[i])) {
					_ball.speedX *= -1;
					_ball.speedY *= -1;
					_ball.object.x += _ball.speedX;
					_ball.object.y += _ball.speedY;
				}
			}
		}
		private function updatePowerups():void
		{
			var l:int = _powerUpArray.length;
			for (var i:int = l-1; i >= 0; i--) 
			{
				_powerUpArray[i].update();
				if (player01.pad.hitTestObject(_powerUpArray[i])) {
					if (_powerUpArray[i].powerupId == 0)
					{
						_powerUpArray[i].sendPower(this);
						removeChild(_powerUpArray[i]);
						_powerUpArray.splice(i, 1);
					}
				} else if (enemy.pad.hitTestObject(_powerUpArray[i])) {
					if (_powerUpArray[i].powerupId == 1)
					{
						_powerUpArray[i].sendPower(this);
						removeChild(_powerUpArray[i]);
						_powerUpArray.splice(i, 1);
					}
				}
			}
		}
		private function obstacleCollision(_currentArray:Array):void
		{
			var l:int = _currentArray.length;
			var spawnPos:Array;
			var whoCanFire:String;
			for (var i:int = l-1; i >= 0; i--) 
			{
				if (_ball.object.hitTestObject(_currentArray[i]))
				{
					SoundManager.playSound(SoundManager.SOUND_DESTROY);
					var r:int = 0;
					if (r == 0)
					{
						var powerUpManager:PowerUpManager;
						powerUpManager = new PowerUpManager();
						var newSpawnPos:Point = new Point(_currentArray[i].x, _currentArray[i].y);
						_powerUpArray.push(powerUpManager.generatePowerUp(_currentArray[i].powerupId, this, newSpawnPos));
					}
					removeChild(_currentArray[i]);
					_currentArray.splice(i, 1);
					
					var newArrayLenght:int = _currentArray.length;
					if (_currentArray == _enemyObstacles)
					{
						if (newArrayLenght == 0)
						{
							// TO DO: win
							break;
							win();
						} else {
							spawnPos = [enemy.pad.x, enemy.pad.y];
							whoCanFire = "enemy";
						}
					} else {
						if (newArrayLenght == 0)
						{
							// TO DO: lose
							break;
							lose();
						} else {
							spawnPos = [player01.pad.x, player01.pad.y];
							whoCanFire = "player";
						}
					}
					_ball.die(this,spawnPos[0],spawnPos[1],whoCanFire);
				}
			}
		}
		private function win():void
		{
			SoundManager.playSound(SoundManager.SOUND_VICTORY);
			_winScreenPlayer01.visible = true;
			removeEventListener(Event.ENTER_FRAME, update);
		}
		private function lose():void
		{
			SoundManager.playSound(SoundManager.SOUND_VICTORY);
			_winScreenPlayer02.visible = true;
			removeEventListener(Event.ENTER_FRAME, update);
		}
		private function padCollision():void
		{
			if(_ball.object.hitTestObject(player01.pad))
			{
				if( _ball.speedX < 0 && player01.pad.currentFrame == 1)
				{
					_ball.speedX *= -1;
					_ball.speedY = BallAngle(player01);
					speedUp();
					SoundManager.playSound(SoundManager.SOUND_BOINK);
				}
			}
			if(_ball.object.hitTestObject(enemy.pad))
			{
				if(_ball.speedX > 0 && enemy.pad.currentFrame == 1)
				{
					_ball.speedX *= -1;
					_ball.speedY = BallAngle(enemy);
					speedUp();
					SoundManager.playSound(SoundManager.SOUND_BOINK2);
				}
			}
		}
		private function speedUp():void
		{
			if (_ball.addedspeed <= 3)
			{
				_ball.addedspeed += 0.1;
			}
		}
		public function addExtraSpeed():void
		{
			_ball.addedspeed += 1;
		}
		private function BallAngle(paddel:Pad):Number
		{
			
			var angel :Number = (_ball.object.height / 2 * ( (_ball.object.y - paddel.pad.y) / paddel.pad.height / 2 ) * 1.5);
			return angel;
			
		}
		
	}

}