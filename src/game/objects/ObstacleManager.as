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
		
		public function ObstacleManager(container:DisplayObjectContainer) 
		{
			for (var i:int = 0; i < 15; i++) 
			{
				var col:int,
					row:int,
					obstacle:MovieClip;
				switch(Math.random() * 5)
				{
					case 0:
						break;
					case 1:
						break;
					case 2:
						break;
					case 3:
						break;
					case 4:
						break;
					default:
						break;
				}
			}
		}
		
	}

}