package game.menu 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class MainMenu extends Sprite 
	{
		private var _menuClip:MenuImage;
		private var _play:PlayButton;
		private var _credits:CreditsButton;
		private var _help:HelpButton;
		private var _helpMenu:HelpMenuImage;
		private var _creditsMenu:CreditsMenuImage;
		public function MainMenu() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			_helpMenu = new HelpMenuImage;
			_helpMenu.gotoAndStop(0);
			_creditsMenu = new CreditsMenuImage;
			_creditsMenu.scaleX = _creditsMenu.scaleX / 2;
			_creditsMenu.scaleY = _creditsMenu.scaleY / 2;
			_helpMenu.scaleX = _helpMenu.scaleX / 2;
			_helpMenu.scaleY = _helpMenu.scaleY / 2;
			_creditsMenu.gotoAndStop(0);
			_menuClip = new MenuImage;
			addChild(_menuClip);
			stage.addEventListener(Event.ENTER_FRAME, clipUpdate);
		}
		
		private function clipUpdate(e:Event):void 
		{
			if (_menuClip.currentFrame == 95)
			{
				_menuClip.gotoAndStop(0);
				changeMenu(_menuClip);
			}
			if (_helpMenu.currentFrame == 90)
			{
				_helpMenu.gotoAndStop(90);
				_helpMenu.addEventListener(MouseEvent.CLICK,exit);
			}
			if (_creditsMenu.currentFrame == 90)
			{
				_helpMenu.gotoAndStop(0);
				removeChild(_creditsMenu);
			}
		}
		
		private function exit(e:MouseEvent):void 
		{
			_helpMenu.removeEventListener(MouseEvent.CLICK, exit);
			_helpMenu.gotoAndStop(0);
			removeChild(_helpMenu);
		}
		private function changeMenu(menu:MovieClip):void
		{
			removeChild(_menuClip);
			
			_play = new PlayButton;
			_help = new HelpButton;
			_credits = new CreditsButton;
			_play.x = 316.95;
			_play.y = 290.55;
			_help.x = 316.95;
			_help.y = 373.85;
			_credits.x = 251;
			_credits.y = 461.65;
			
			var buttonHolder:MovieClip = new MovieClip;
			addChild(buttonHolder);
			buttonHolder.addChild(_help);
			buttonHolder.addChild(_play);
			buttonHolder.addChild(_credits);
			
			buttonHolder.addEventListener(MouseEvent.CLICK,push)
		}
		
		private function push(e:MouseEvent):void 
		{
			if (e.target == _play)
			{
				stage.removeEventListener(Event.ENTER_FRAME, clipUpdate);
				dispatchEvent(new Event("start"));
			}
			if (e.target == _help)
			{
				addChild(_helpMenu);
				_helpMenu.gotoAndPlay(0);
			}
			if (e.target == _credits)
			{
				addChild(_creditsMenu);
				_creditsMenu.gotoAndPlay(0);
			}
		}
	}
}