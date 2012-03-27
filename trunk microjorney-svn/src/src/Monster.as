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
		public function Monster(x:int, y:int, sprite:Class, type:int, life:int)
		{
			super(x * 16, y * 16);
			
			loadGraphic(sprite, true, true, 16, 16);
			this.addAnimation("RED_walkUP", [0, 1], 7, false);				this.addAnimation("RED_walkLEFT", [2, 3], 7, false);
			this.addAnimation("RED_walkRIGHT", [4, 5], 7, false);			this.addAnimation("RED_walkDOWN", [6, 7], 7, false);
			
			this.addAnimation("BLUE_walkUP", [8, 9], 7, false);				this.addAnimation("BLUE_walkLEFT", [10, 11], 7, false);
			this.addAnimation("BLUE_walkRIGHT", [12, 13], 7, false);		this.addAnimation("BLUE_walkDOWN", [14, 15], 7, false);
			
			this.addAnimation("GREEN_walkUP", [16, 17], 7, false);			this.addAnimation("GREEN_walkLEFT", [18, 19], 7, false);
			this.addAnimation("GREEN_walkRIGHT", [20, 21], 7, false);		this.addAnimation("GREEN_walkDOWN", [22, 23], 7, false);
			
			this.addAnimation("ORANGE_walkUP", [24, 25], 7, false);			this.addAnimation("ORANGE_walkLEFT", [26, 27], 7, false);
			this.addAnimation("ORANGE_walkRIGHT", [28, 29], 7, false);		this.addAnimation("ORANGE_walkDOWN", [30, 31], 7, false);
			
			this.addAnimation("RED_dying", [0, 2, 5, 7, 0, 2, 5, 7], 12, false);
			
			this.immovable = true;
			
			_life = life;
		}
		
		override public function kill():void
		{
			//play("RED_dying");
			//if (this.finished)
				super.kill();
		}
		
		override public function update():void
		{
			super.update();
		}
	}

}