package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class PlayState extends FlxState
	{
		private var player:FlxSprite;
		private var scene:MainMap;
		// variables to snap hero movement
		private var inicX:Number;  		private var finalX:Number;
		private var inicY:Number;  		private var finalY:Number;
		
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
			player = new FlxExtendedSprite(32, 32, AssetsRegistry.hero);
			/* map instance here */
			scene = new MainMap;
			
			//	Bring up the Flixel debugger if you'd like to watch these values in real-time
			FlxG.watch(player.velocity, "x", "vx");
			FlxG.watch(player.velocity, "y", "vy");

			add(scene);
			add(player);
		}
		
		/* bad processing here*/
		override public function update():void
		{
			super.update();	
			
			if (FlxG.keys.RIGHT) { /*snapped movement*/
				inicX = player.x;
				player.x += 1;
				finalX = player.x;
			FlxG.collide(player, scene.map);
			}
			if (FlxG.keys.LEFT) { /*snapped movement*/
				inicX = player.x;
				player.x -= 1;
				finalX = player.x;
			FlxG.collide(player, scene.map);
			}

			if (FlxG.keys.UP) { /*snapped movement*/
				inicY = player.y;
				player.y -= 1;
				finalY = player.y;
			FlxG.collide(player, scene.map);
			}
			if (FlxG.keys.DOWN) { /*snapped movement*/
				inicY = player.y;
				player.y += 1;
				finalY = player.y;
			FlxG.collide(player, scene.map);
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