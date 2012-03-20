package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class PlayState extends FlxState
	{
		private var player:Char;
		private var scene:MainMap;
		
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
				//player = new FlxExtendedSprite(32, 32, AssetsRegistry.hero);
			player = new Char(32, 32);
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
			// Snapped Movement of 8x8 HERE!
			player.move(8, 8);
			FlxG.collide(player, scene);
		}
		override public function destroy():void
		{
			//	Important! Clear out the plugin otherwise resources will get messed right up after a while
			FlxControl.clear();
			
			super.destroy();
		}
	}
}