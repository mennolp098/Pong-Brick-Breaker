package game.objects 
{
	import flash.display.DisplayObjectContainer;
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class Player extends Pad
	{
		private var _Ymovement:Number;
		public function Player(container:DisplayObjectContainer) 
		{
			super(container);
			
			_pad.addEventListener(KeyboardEvent.KEY_DOWN, keyDown);
			_pad.addEventListener(KeyboardEvent.KEY_UP, keyUp);
		
		}
		private function keyDown(e:KeyboardEvent):void
		{
			if (e.keyCode == 38)
			{
				_Ymovement = -1;
			} 
			if (e.keyCode == 40)
			{
				_Ymovement = 1;
			}
			changeVelocity(_Ymovement);
		}
		private function keyUp(e:KeyboardEvent):void
		{
			if (e.keyCode == 38)
			{
				_Ymovement = 0;
			} 
			else if (e.keyCode == 40)
			{
				_Ymovement = 0;
			}
			changeVelocity(_Ymovement);
		}
	}
}