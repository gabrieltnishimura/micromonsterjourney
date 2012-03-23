package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class PlayState extends FlxState
	{
		private var player:Char;
		private var scene:MainMap;
		private var button:FlxButton;
		public var follow:int;
		
		/**
		 * @todo [MODULAR]
		 * This constructor can receive parameters to change PlayState variables.
		 **/
		public function PlayState()
		{
		}

		override public function create():void
		{
			
			/* hero instance here */
				player = new Char(32, 32);
			/* map instance here */
				scene = new MainMap;				
				
			//	Bring up the Flixel debugger if you'd like to watch these values in real-time
			FlxG.watch(player.Sprite, "x", "X Position");
			FlxG.watch(player.Sprite, "y", "Y Position");
				
			FlxG.watch(scene.pixel, "x", "X Position");
			FlxG.watch(scene.pixel, "y", "Y Position");
		
			// adding entitiees to the screen
			add(scene);
			add(scene.pixel)
			add(button);
			add(player);
			add(player.Sprite);
			FlxG.mouse.show();
		}
		
		/* bad processing here*/
		override public function update():void
		{
			super.update();	
			// Snapped Movement of 8x8 HERE!
			if (scene.pixel.velocity.x ==0 && scene.pixel.velocity.y == 0) {
				player.move(8, 8);
				FlxG.collide(player, scene);
				player.smooth_move();
			}
			else { player.Sprite.velocity.x = 0; player.Sprite.velocity.y = 0; }
			
			if ((scene.pixel.velocity.y > 0 && scene.pixel.y > FlxG.worldBounds.y + 80) || 
				(scene.pixel.velocity.y < 0 && scene.pixel.y < FlxG.worldBounds.y + 80)) {
				scene.pixel.velocity.y = 0; scene.pixel.y = FlxG.worldBounds.y + 80;
			}
			if ((scene.pixel.velocity.x > 0 && scene.pixel.x > FlxG.worldBounds.x + 120) ||
				(scene.pixel.velocity.x < 0 && scene.pixel.x < FlxG.worldBounds.x + 120))  {
				scene.pixel.velocity.x = 0; scene.pixel.x = FlxG.worldBounds.x + 120;
			}
		
				if (player.y +16> FlxG.worldBounds.y + 160) {
					player.y += 16;
					scene.changeWorldBound("down");
					player.smooth_move();;
				}	
				if (player.y < FlxG.worldBounds.y) {
					player.y -= 16;
					scene.changeWorldBound("up");
					player.smooth_move();
				}
		}
		override public function destroy():void
		{
			//	Important! Clear out the plugin otherwise resources will get messed right up after a while
			FlxControl.clear();
			
			super.destroy();
		}
	}
}