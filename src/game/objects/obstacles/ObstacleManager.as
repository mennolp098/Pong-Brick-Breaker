package game.objects.obstacles 
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
			var x:int = beginX;
			var y:int = 100;
			var displayImage:MovieClip;
			
			for (var i:int = 0; i < 15; i++) 
			{
				displayImage = new ObstacleImage01();
				var obstacle:Obstacle;
				var tabel:int = Math.random() * 7;
				displayImage.gotoAndStop(tabel);
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