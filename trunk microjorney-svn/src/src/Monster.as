package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxExtendedSprite;

	public class Monster extends FlxExtendedSprite
	{
		/**
		 * Instanciates a monster at x*16 and y*16 in the game.
		 * @todo Sprite with animations of the monster
		 * @param	x x TILE position in the game
		 * @param	y y TILE position in the game
		 * @param	sprite STATIC Sprite of the monster
		 * @param	life Number of hits the monster can take (for now)
		 */
		public var _life:Number;
		public function Monster(x:int, y:int, sprite:Class , life:int)
		{
			super(x * 16, y * 16);
			this.immovable = true;
			loadGraphic(sprite, true, true, 16, 16);
			_life = life;
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