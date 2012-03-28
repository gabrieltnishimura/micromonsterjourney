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
		public var leftOrRight:String = "left";
		public var upOrDown:String = "down";
		
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
			Sprite.loadGraphic(AssetsRegistry.heroSheetPNG, true, false, 16, 16, false);
			Sprite.addAnimation("walkDOWN", [0, 1], 7, false);  			Sprite.addAnimation("walkUP", [2, 3], 7, false);
			Sprite.addAnimation("walkLEFT", [4, 5], 7, false);  			Sprite.addAnimation("walkRIGHT", [6, 7], 7, false);
			Sprite.addAnimation("stopDOWN", [1], 1, false);					Sprite.addAnimation("stopUP", [3], 1, false);
			Sprite.addAnimation("stopLEFT", [5], 1, false);					Sprite.addAnimation("stopRIGHT", [7], 1, false);
			
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
				//if (FlxG.keys.pressed("RIGHT"))
				//{
				 //Sprite.play("walkRIGHT");
				//}
				//else if (FlxG.keys.pressed("LEFT"))
				//{
				 //Sprite.play("walkLEFT");
				//}
				//else if (FlxG.keys.pressed("UP"))
				//{
				 //Sprite.play("walkUP");
				//}
				//else if (FlxG.keys.pressed("DOWN"))
				//{
				 //Sprite.play("walkDOWN");
				//}
				if (FlxG.keys.any()){
				switch (facing) {
					case FlxObject.LEFT:
						Sprite.play("walkLEFT");
						break;
					case FlxObject.RIGHT:
						Sprite.play("walkRIGHT");
						break;
					case FlxObject.UP:
						Sprite.play("walkUP");
						break;
					case FlxObject.DOWN:
						Sprite.play("walkDOWN");
						break;
				}}
				if (FlxG.keys.justReleased("DOWN"))
				{
				 Sprite.play("stopDOWN", true);
				}
				if (FlxG.keys.justReleased("UP"))
				{
				 Sprite.play("stopUP", true);
				}
				if (FlxG.keys.justReleased("LEFT"))
				{
				 Sprite.play("stopLEFT", true);
				}
				if (FlxG.keys.justReleased("RIGHT"))
				{
				 Sprite.play("stopRIGHT", true);
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
			
			//if (FlxG.keys.pressed("LEFT"))
			//{
	 			//if (this.x-1 == Sprite.x)
				//{
					//deltaX = this.x - snapX;
					//deltaY = this.y;
				//}
				//
			//}
			//else if (FlxG.keys.pressed("UP"))
			//{
				//if (this.y == Sprite.y)
				//{
					//deltaX = this.x;
					//deltaY = this.y - snapY;
				//}
				//
			//}
			//else if (FlxG.keys.pressed("RIGHT"))
			//{
				//if (this.x-1 == Sprite.x)
				//{
					//deltaX = this.x + snapX;
					//deltaY = this.y;
				//}
			//}
			//else if (FlxG.keys.pressed("DOWN"))
			//{
				//if (this.y == Sprite.y)
				//{
					//deltaX = this.x;
					//deltaY = this.y + snapY;
				//}
			//}
			
			if (FlxG.keys.justPressed("LEFT")) {
				facing = FlxObject.LEFT;
				leftOrRight = "left";
			}
			if (FlxG.keys.justPressed("RIGHT")) {
				facing = FlxObject.RIGHT;
				leftOrRight = "right";
			}
			if (FlxG.keys.justPressed("UP")) {
				facing = FlxObject.UP;
				upOrDown = "up";
			}
			if (FlxG.keys.justPressed("DOWN")) {
				facing = FlxObject.DOWN;
				upOrDown = "down";
			}
			if (FlxG.keys.justReleased("LEFT") || FlxG.keys.justReleased("RIGHT")) {
				if (FlxG.keys.UP && (upOrDown == "up")) facing = FlxObject.UP;
				if (FlxG.keys.DOWN && (upOrDown == "down")) facing = FlxObject.DOWN;
			}
			if (FlxG.keys.justReleased("UP") || FlxG.keys.justReleased("DOWN")) {
				if (FlxG.keys.LEFT && (leftOrRight == "left")) facing = FlxObject.LEFT;
				if (FlxG.keys.RIGHT && (leftOrRight == "right")) facing = FlxObject.RIGHT;
			}
			if(FlxG.keys.LEFT && facing == FlxObject.LEFT)
			{
	 			if (this.x-1 == Sprite.x)
				{
					deltaX = this.x - snapX;
					deltaY = this.y;
				}
				
			}
			if(FlxG.keys.RIGHT && facing == FlxObject.RIGHT)
			{
				if (this.x-1 == Sprite.x)
				{
					deltaX = this.x + snapX;
					deltaY = this.y;
				}
			}
			if(FlxG.keys.UP && facing == FlxObject.UP)
			{
				if (this.y == Sprite.y)
				{
					deltaX = this.x;
					deltaY = this.y - snapY;
				}
				
			}
			if (FlxG.keys.DOWN && facing == FlxObject.DOWN)
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
		
		/**
		 * This function deals 10 damage on the player
		 */
		public function damagePlayerOnly():void
		{
			this.hurt(10);
		}
	}
}