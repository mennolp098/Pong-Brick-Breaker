package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import game.Game;
	import game.menu.MainMenu;
	import game.objects.obstacles.Obstacle;
	
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class Main extends Sprite 
	{
		private var _bg:Background;
		private var _menu:MainMenu;
		public function Main():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			_bg = new Background;
			addChild(_bg);
			_menu = new MainMenu;
			addChild(_menu);
			
			_menu.addEventListener("start", StartGame);
			
		}
		
		private function StartGame(e:Event):void 
		{
			
			var _game:Game;
			_game = new Game();
			addChild(_game);
			_menu.removeEventListener("start", StartGame);
			removeChild(_menu);
		}
	}
	
}