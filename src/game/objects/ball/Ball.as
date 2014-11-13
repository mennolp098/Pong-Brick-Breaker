package game.objects.ball 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.display.DisplayObjectContainer;
	import game.objects.pads.Player;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class Ball extends Sprite
	{
		public var speedX:int = -6;
		public var speedY:int;
		public var object:MovieClip;
		public var isFired:Boolean;
		private var _whoCanFire:String;
		private var _player:Player;
		public function Ball(container:DisplayObjectContainer, player:Player) 
		{
			object = new ballImage();
			container.addChild(object);
			isFired = true;
			_player = player;
		}
		public function update(container:DisplayObjectContainer):void
		{
			object.x += speedX + Math.abs(speedY/1.25);
			object.y += speedY;
			object.scaleX = speedX/6;
			trace(speedX);
			if (object.y >= container.stage.stageHeight)
			{
				speedY *= -1;
			}
			if (object.y <= 0)
			{
				speedY *= -1;
			}
			if (!isFired)
			{
				if (_whoCanFire == "player")
				{
					object.x = _player.pad.x;
					object.y = _player.pad.y;
				}
			}
		}
		public function die(container:DisplayObjectContainer,posX:Number, posY:Number,whoCanFire:String):void
		{
			speedX = 0;
			speedY = 0;
			_whoCanFire = whoCanFire;
			changeImage(container,posX,posY);
		}
		private function changeImage(container:DisplayObjectContainer,posX:Number, posY:Number):void
		{
			var frame:int = Math.random() * 8;
			object.gotoAndStop(frame+1);
			object.x = posX;
			object.y = posY;
			isFired = false;
		}
		public function fireBall(iFire:String):void
		{
			if (_whoCanFire == iFire && iFire == "player" && !isFired)
			{
				speedX = 6;
				speedY = Math.random() * 6 - 3;
				isFired = true;
			} else if(!isFired && _whoCanFire == iFire) {
				speedX = -6;
				speedY = Math.random() * 6 - 3;
				isFired = true;
			}
		}
	}
}