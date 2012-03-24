package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxExtendedSprite;

	public class Monster extends FlxExtendedSprite
	{
		/**
		 * Instanciates a monster at x*16 and y*16 in the game.
		 * @param	x
		 * @param	y
		 */
		public function Monster(x:int, y:int)
		{
			super(x * 16, y * 16);
			this.immovable = true;
			loadGraphic(AssetsRegistry.monster, true, true, 16, 16);
		}
		
		override public function kill():void
		{
			super.kill();
		}
		
		override public function update():void
		{
			super.update(); 
		}
	}

}