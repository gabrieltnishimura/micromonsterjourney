package  
{
	import org.flixel.*;

	public class Monster extends FlxSprite
	{
		/**
		 * Instanciates a monster at x*16 and y*16 in the game.
		 * @param	x
		 * @param	y
		 */
		public function Monster(x:int, y:int)
		{
			super(x * 16, y * 16);
			
			loadGraphic(AssetsRegistry.monster, true, true, 16, 16);
		}
		
		override public function kill():void
		{
		}
		
		override public function update():void
		{
			super.update();
		}
	}

}