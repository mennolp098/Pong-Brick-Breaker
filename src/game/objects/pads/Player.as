package game.objects.pads 
{
	import flash.display.DisplayObjectContainer;
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class Player extends Pad
	{
		private var _upKey:int;
		private var _downKey:int;
		public function Player(container:DisplayObjectContainer, player02:Boolean) 
		{
			super(container);
			pad.x = 200;
			if (player02)
			{
				_upKey = 87;
				_downKey = 83;
			} else {
				_upKey = 38;
				
				_downKey = 40;
			}
			container.stage.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			container.stage.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		
		}
		private function keyDown(e:KeyboardEvent):void
		{
			if (e.keyCode == _upKey)
			{
				_yVelocity = -1;
				pad.gotoAndStop(4);
			} 
			if (e.keyCode == _downKey)
			{
				_yVelocity = 1;
				pad.gotoAndStop(5);
			}
		}
		private function keyUp(e:KeyboardEvent):void
		{
			if (e.keyCode == _upKey)
			{
				_yVelocity = 0;
				pad.gotoAndStop(1);
			} 
			if (e.keyCode == _downKey)
			{
				_yVelocity = 0;
				pad.gotoAndStop(1);
			}
		}
	}
}