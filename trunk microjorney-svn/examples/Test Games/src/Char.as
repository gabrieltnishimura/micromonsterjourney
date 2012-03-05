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
		public var Sprite:FlxExtendedSprite;
		
		public function Char(x:int = 0, y:int = 0)
		{
			super(x, y);
			this.visible = false;
			Sprite = new FlxExtendedSprite(x, y);
		}
		
		public function Move(snapX:int, snapY:int):void
		{
			var deltaX:int = this.x;
			var deltaY:int = this.y;
			if (FlxG.keys.justReleased("LEFT"))
			//if (FlxG.keys.LEFT)
			{
				//Char.x = int(Math.floor(Char.x / snapX) * snapX);
				deltaX = this.x - snapX;
				deltaY = this.y;
			}
			if (FlxG.keys.justReleased("UP"))
			//if (FlxG.keys.UP)
			{
				//Char.y = int(Math.floor(Char.y / snapY) * snapY);
				deltaX = this.x;
				deltaY = this.y - snapY;
			}
			if (FlxG.keys.justReleased("RIGHT"))
			//if (FlxG.keys.RIGHT)
			{
				//Char.x = int(Math.ceil(Char.x / snapX) * snapX);
				deltaX = this.x + snapX;
				deltaY = this.y;
			}
			if (FlxG.keys.justReleased("DOWN"))
			//if (FlxG.keys.DOWN)
			{
				//Char.y = int(Math.ceil(Char.y / snapY) * snapY);
				deltaX = this.x;
				deltaY = this.y + snapY;
			}
			this.x = deltaX;
			this.y = deltaY;
			//if (FlxG.keys.justReleased("LEFT") || FlxG.keys.justReleased("UP") || FlxG.keys.justReleased("RIGHT") || FlxG.keys.justReleased("DOWN")) {
				//trace(deltaY);
			//FlxVelocity.moveTowardsPoint(this, new FlxPoint(deltaX, deltaY), 100);
			//}
		}
		
		public function CreateChar():void
		{
			Sprite.makeGraphic(16, 16, 0xFF0000FF);
		}
		
		override public function update():void
		{
			Sprite.x = this.x;
			Sprite.y = this.y;
			super.update();
		}
		
	}

}