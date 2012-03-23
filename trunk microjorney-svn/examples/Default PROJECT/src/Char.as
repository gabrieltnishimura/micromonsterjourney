package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	/**
	 * Class that represents the main character of the game.
	 * It has 2 sprites: one for the snapped movement, and another for the smooth movement.
	 */
	public class Char extends FlxExtendedSprite
	{
		private var speed:Number;
		public var Sprite:FlxExtendedSprite;
		
		/**
		 * Constructor of the class. It shows the hero sprite at (inicX, inicY).
		 * @param	inicX Inicial x position of the sprite of the character. Default 0.
		 * @param	inicY Inicial y position of the sprite of the character. Default 0.
		 */
		public function Char(inicX:int = 0, inicY:int = 0)
		{
			Sprite = new FlxExtendedSprite(inicX, inicY, AssetsRegistry.playerUP);
			super(inicX, inicY);
			this.visible = false; // the sprite of character is invisible, as is is only necessary to snap.
		}
		
		/**
		 * Function that moves the FlxExtendedSprite Char in a grid of snapX*snapY.
		 * Only works when smooth_move() is called right after it.
		 * @param	snapX How many pixels will it snap in the x axis.
		 * @param	snapY How many pixels will it snap in the y axis.
		 */
		public function move(snapX:int, snapY:int):void
		{
			var deltaX:int = this.x;
			var deltaY:int = this.y;
			
			if (FlxG.keys.pressed("LEFT"))
			{
				if (this.x == Sprite.x)
				{
					Sprite.loadGraphic(AssetsRegistry.playerLEFT, false, false, 16, 16);
					deltaX = this.x - snapX;
					deltaY = this.y;
				}
			}
			else if (FlxG.keys.pressed("UP"))
			{
				if (this.y == Sprite.y)
				{
					Sprite.loadGraphic(AssetsRegistry.playerUP, false, false, 16, 16);
					deltaX = this.x;
					deltaY = this.y - snapY;
				}
			}
			else if (FlxG.keys.pressed("RIGHT"))
			{
				if (this.x == Sprite.x)
				{
					Sprite.loadGraphic(AssetsRegistry.playerRIGHT, false, false, 16, 16);
					deltaX = this.x + snapX;
					deltaY = this.y;
				}
			}
			else if (FlxG.keys.pressed("DOWN"))
			{
				if (this.y == Sprite.y)
				{
					Sprite.loadGraphic(AssetsRegistry.playerDOWN, false, false, 16, 16);
					deltaX = this.x;
					deltaY = this.y + snapY;
				}
			}
			this.x = deltaX;
			this.y = deltaY;
		}
		
		/**
		 * Function that smoothly moves the visible sprite
		 * to where the invisible sprite was placed.
		 * @param	speed Movement speed of the visible sprite. Default is 75.
		 */
		public function smooth_move(speed:int = 75):void
		{
			if (Sprite.x < this.x)
			{
				Sprite.velocity.x = speed;
			}
			if (Sprite.x > this.x)
			{
				Sprite.velocity.x = -speed;
			}
			if (Sprite.y < this.y)
			{
				Sprite.velocity.y = speed;
			}
			if (Sprite.y > this.y)
			{
				Sprite.velocity.y = -speed;
			}
			if (Math.abs(Sprite.x - this.x)<1)
			{
				Sprite.velocity.x = 0;
				Sprite.x = this.x;
			}
			if (Math.abs(Sprite.y - this.y)<1)
			{
				Sprite.velocity.y = 0;
				Sprite.y = this.y;
			}
		}
	}
}