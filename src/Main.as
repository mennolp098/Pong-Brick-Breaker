package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import game.Game;
	import game.objects.obstacles.Obstacle;
	
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class Main extends Sprite 
	{
		
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// entry point
			var _game:Game;
			_game = new Game();
			addChild(_game);
		}
		
		
	}
	
}