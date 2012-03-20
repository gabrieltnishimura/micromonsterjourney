package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	/**
	 * ...
	 * @author CKoji
	 */
	public class Char extends FlxExtendedSprite
	{
		private var _speed:Number = 100;
		public var Sprite:FlxExtendedSprite;
		
		public function Char(inicX:int = 0, inicY:int = 0)
		{
			super(inicX, inicY);
			this.visible = false;
			Sprite = new FlxExtendedSprite(inicX, inicX);
		}
		
		public function move(snapX:int, snapY:int):void
		{
			var deltaX:int = this.x;
			var deltaY:int = this.y;
			
			if (FlxG.keys.justPressed("LEFT"))
			{
			deltaX = this.x - snapX;
			deltaY = this.y;
			}
			if (FlxG.keys.justPressed("UP"))
			{
			deltaX = this.x;
			deltaY = this.y - snapY;
			}
			if (FlxG.keys.justPressed("RIGHT"))
			{
			deltaX = this.x + snapX;
			deltaY = this.y;
			}
			if (FlxG.keys.justPressed("DOWN"))
			{
			deltaX = this.x;
			deltaY = this.y + snapY;
			}
			this.x = deltaX;
			this.y = deltaY;
			this.SmoothMove();
		}
		
		public function CreateChar():void
		{
			Sprite.makeGraphic(16, 16, 0xFF0000FF);
		}
		
		private function SmoothMove(direction:int):void
		{
			if (Sprite.x < this.x)
			{
				Sprite.velocity.x = _speed;
			}
			if (Sprite.x > this.x)
			{
				Sprite.velocity.x = -_speed;
			}
			if (Sprite.y < this.y)
			{
				Sprite.velocity.y = _speed;
			}
			if (Sprite.y > this.y)
			{
				Sprite.velocity.y = -_speed;
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