package game.objects 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class Obstacle extends Sprite
	{
		public var displayArt:MovieClip;
		public var powerupId:int;
		public function Obstacle(art:MovieClip,id:int) 
		{
			displayArt = art;
			addChild(displayArt);
			powerupId = id;
			
		}
		
	}

}