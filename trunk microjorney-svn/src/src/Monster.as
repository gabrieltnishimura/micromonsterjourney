package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxExtendedSprite;

	public class Monster extends FlxExtendedSprite
	{
		public var _life:Number;
		public var Sprite:FlxExtendedSprite;
		private var _isDead:Boolean;
		private var rnd:Number;
		private var aiController:FlxTimer;
		private var hasMoved:Boolean;
		
		private var deltaX:Number;
		private var deltaY:Number;
		private var snapX:Number;
		private var snapY:Number;
		private var randomSnap:Number;
		
		/**
		 * Instanciates a monster at x*16 and y*16 in the game.
		 * @todo Sprite with animations of the monster
		 * @param	x x TILE position in the game
		 * @param	y y TILE position in the game
		 * @param	sprite STATIC Sprite of the monster
		 * @param	life Number of hits the monster can take (for now)
		 */
		public function Monster(x:int, y:int, sprite:Class, type:int, life:int, isDead:Boolean = false)
		{
			super(x * 16, y * 16);
			Sprite =  new FlxExtendedSprite(x * 16, y * 16);
			this.visible = false;
			
			Sprite.loadGraphic(sprite, true, true, 16, 16);
			Sprite.addAnimation("walkUP", [0, 1, 0, 1], 7, false);		Sprite.addAnimation("walkLEFT", [2, 3, 2, 3], 7, false);
			Sprite.addAnimation("walkRIGHT", [4, 5, 4, 5], 7, false);		Sprite.addAnimation("walkDOWN", [6, 7, 6, 7], 7, false);
	
			Sprite.addAnimation("RED_dying", [0, 2, 5, 7], 15, false);
			
			_life = life;
			_isDead = isDead;
			
			aiController = new FlxTimer();
			aiController.start(3, 0, onTimer);
			hasMoved = false;
			
			deltaX = this.x;
			deltaY = this.y;
		}
		
		override public function kill():void
		{
			Sprite.play("RED_dying");
			_isDead = true;
		}
		
		override public function update():void
		{
			/* If monster is not on the current world bound, KILL"HIM */ 
			if (!(this.x >= (FlxG.worldBounds.left) && this.x < (FlxG.worldBounds.right ) &&
			this.y >= (FlxG.worldBounds.top) && this.y < (FlxG.worldBounds.bottom))) {
				super.kill();
				Sprite.kill();
				//super.destroy();
			}
					
			super.update();
			aiController.update();
			
			if (Sprite.finished && _isDead == true)
			{
				Sprite.kill();
				//aiController.destroy();
				super.kill();
				trace("Monster died");
			}
			/* AI movement! */
			if (!hasMoved)
			{
				if  (rnd >= 0 && rnd < 1 / 4) // move down
				{
					hasMoved = true;
					
					deltaX = this.x;
					deltaY = this.y + snapY;
					Sprite.play("walkUP");
				}
				
				if  (rnd >= 1 / 4 && rnd < 2 / 4) // move up
				{
					hasMoved = true;
					
					deltaX = this.x;
					deltaY = this.y - snapY;
					Sprite.play("walkDOWN");
				}
				
				if  (rnd >= 2 / 4 && rnd < 3 / 4) // move left
				{
					hasMoved = true;
					
					deltaX = this.x - snapX;
					deltaY = this.y;
					Sprite.play("walkLEFT");
				}
				
				if  (rnd >= 3 / 4 && rnd < 4 / 4) // move right
				{
					hasMoved = true;
					
					deltaX = this.x + snapX;
					deltaY = this.y;
					Sprite.play("walkRIGHT");
				}
				
			this.x = deltaX;
			this.y = deltaY;
			}
			smooth_move();			
		}
		
		private function onTimer(timer: FlxTimer):void
		{
			hasMoved = false;
			rnd = FlxG.random();
			
			randomSnap = FlxG.random();
				if (randomSnap >= 0 && randomSnap < 1 / 2) 
				{
					snapX = 40;
					snapY = 40;
				}
				if (randomSnap >= 1 / 2 && randomSnap < 2 / 2)
				{
					snapX = 24;
					snapY = 24;
				}					
		}
		
		/**
		 * Function that smoothly moves the visible sprite
		 * to where the invisible sprite was placed.
		 * @param	speed Movement speed of the visible sprite. Default is 75.
		 */
		private function smooth_move(speed:int = 75):void
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