package game.objects 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class Obstacle extends Sprite
	{
		public var displayArt:MovieClip;
		public var powerupId:int;
		public var removeable:Boolean = false;
		public function Obstacle(art:MovieClip,id:int) 
		{
			displayArt = art;
			addChild(displayArt);
			powerupId = id;
			
		}
		
	}

}