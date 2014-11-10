package game.objects 
{
	import flash.display.DisplayObjectContainer;
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class ObstacleManager 
	{
		public function spawnObstacles(container:DisplayObjectContainer, beginX:Number, powerupId:int):Array
		{
			var currentArray:Array = [];
			var counter:int = 0;
			var x:int = 10;
			var y:int = 100;
			var displayImage:MovieClip;
			
			for (var i:int = 0; i < 15; i++) 
			{
				var obstacle:Obstacle;
				switch(Math.random() * 5)
				{
					case 0:
						displayImage = new ObstacleImage01();
						break;
					case 1:
						displayImage = new ObstacleImage01();
						break;
					case 2:
						displayImage = new ObstacleImage01();
						break;
					case 3:
						displayImage = new ObstacleImage01();
						break;
					case 4:
						displayImage = new ObstacleImage01();
						break;
					default:
						displayImage = new ObstacleImage01();
						break;
				}
				obstacle = new Obstacle(displayImage,powerupId);
				container.addChild(obstacle);
				obstacle.x = x;
				obstacle.y = y + (100*i);
				counter++;
				currentArray.push(obstacle);
				if (counter == 5)
				{
					counter = 0;
					x += 50;
					y -= 500;
				}
			}
			return currentArray;
		}
	}
}