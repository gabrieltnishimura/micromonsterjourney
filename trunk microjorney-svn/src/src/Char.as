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
		public var Attack:FlxExtendedSprite;
		
		/**
		 * Constructor of the class. It shows the hero sprite at (inicX, inicY).
		 * @param	inicX Inicial x position of the sprite of the character. Default 0.
		 * @param	inicY Inicial y position of the sprite of the character. Default 0.
		 */
		public function Char(inicX:int = 0, inicY:int = 0)
		{	
			super(inicX, inicY);
			this.health = 100;
			this.visible = false; // the sprite of character is invisible, as it is only necessary to snap.
			
			/* This is the visible part of the hero: it has 4 walking animations */
			Sprite =  new FlxExtendedSprite(inicX - 1, inicY);
			Sprite.loadGraphic(AssetsRegistry.heroTestPNG, true, false, 18, 16, false);
			Sprite.addAnimation("walkDOWN", [0, 2, 1, 2], 9, false);  			Sprite.addAnimation("walkUP", [2, 3], 7, false);
			Sprite.addAnimation("walkLEFT", [4, 5], 7, false);  			Sprite.addAnimation("walkRIGHT", [6, 7], 7, false);
			Sprite.addAnimation("stopDOWN", [2], 1, false);
			
			/* This is the hero attacking animation */
			Attack = new FlxExtendedSprite();
			Attack.loadGraphic(AssetsRegistry.heroSwingPNG, true, true, 31, 31, true);
			Attack.addAnimation("attackLEFT", [0, 1, 2], 15, false);
			Attack.visible = false;
			
		}
		
		override public function kill():void
		{
			Sprite.kill();
			super.kill();
			trace ("You dead Asshole");
		}
		
		override public function update():void
		{
			super.update();
			
			if (Sprite.velocity.x == 0 && Sprite.velocity.y == 0) 
			{
				if (FlxG.keys.justPressed("Z")) {
					Attack.x = Sprite.x - 16;
					Attack.y = Sprite.y - 16;
					Attack.visible = true;
					Sprite.visible = false;
					Attack.play("attackLEFT");
				}
				if (Attack.finished)
				{
					Attack.visible = false;
					Sprite.visible = true;
				}
			}
				if (FlxG.keys.pressed("RIGHT"))
				{
					Sprite.play("walkRIGHT");
				}
				if (FlxG.keys.justReleased("DOWN"))
				{
					Sprite.play("stopDOWN", true);
				}
				if (FlxG.keys.pressed("LEFT"))
				{
					Sprite.play("walkLEFT");
				}
				if (FlxG.keys.pressed("UP"))
				{
					Sprite.play("walkUP");
				}
				if (FlxG.keys.pressed("DOWN"))
				{
					Sprite.play("walkDOWN");
				}
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
	 			if (this.x-1 == Sprite.x)
				{
					deltaX = this.x - snapX;
					deltaY = this.y;
				}
				
			}
			else if (FlxG.keys.pressed("UP"))
			{
				if (this.y == Sprite.y)
				{
					deltaX = this.x;
					deltaY = this.y - snapY;
				}
				
			}
			else if (FlxG.keys.pressed("RIGHT"))
			{
				if (this.x-1 == Sprite.x)
				{
					deltaX = this.x + snapX;
					deltaY = this.y;
				}
			}
			else if (FlxG.keys.pressed("DOWN"))
			{
				if (this.y == Sprite.y)
				{
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
			if (Sprite.x < this.x-1)
			{
				Sprite.velocity.x = speed;
			}
			if (Sprite.x > this.x-1)
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
				Sprite.x = this.x - 1;
			}
			if (Math.abs(Sprite.y - this.y)<1)
			{
				Sprite.velocity.y = 0;
				Sprite.y = this.y;
			}
		}
	}
}