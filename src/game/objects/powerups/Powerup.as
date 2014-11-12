package game.objects.powerups 
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Menno Jongejan
	 */
	public class Powerup extends Sprite
	{
		protected var powerupImage:MovieClip;
		public function Powerup() 
		{
			powerupImage = new Power01();
			addChild(powerupImage);
		}
	}
}