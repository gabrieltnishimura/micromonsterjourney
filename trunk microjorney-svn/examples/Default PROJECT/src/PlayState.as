package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class PlayState extends FlxState
	{
		private var player:Char;
		private var scene:MainMap;
		private var mFactory:MonsterFactory;
		private var iFactory:ItemFactory;
		private var button:FlxButton;
		
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
			/* monster factory instance here */
				mFactory = new MonsterFactory;
			/* item factory instance here */
				iFactory = new ItemFactory;
			/* button instance here */
			
			//	Bring up the Flixel debugger if you'd like to watch these values in real-time
			FlxG.watch(player.Sprite, "x", "Player X coord");
			FlxG.watch(player.Sprite, "y", "Player Y coord");
				
			FlxG.watch(scene.pixel, "x", "Pixel X coord");
			FlxG.watch(scene.pixel, "y", "Pixel Y coord");
		
			FlxG.watch(scene.pixel.velocity, "x", "Pixel VelocityX");
			FlxG.watch(scene.pixel.velocity, "y", "Pixel VelocityY");
			FlxG.watch(player, "health", "health");
			
			mFactory.addMonster(Math.floor(Math.random()* 13)+2, Math.floor(Math.random()* 9)+2);
			iFactory.addItem(6, 5, 1);
			
			// adding entities to the screen
			add(scene.map); 				add(scene.pixel)
			add(player); 					add(player.Sprite);
			add(scene.mapcollision);  		add(mFactory);
			add(scene.items);				add(iFactory);
			add(button)
			FlxG.mouse.show();
		}
		
		/*bad processing here - maybe not!*/
		override public function update():void
		{
			super.update();	
			// Snapped Movement of 8x8 HERE!
			if (scene.pixel.velocity.x == 0 && scene.pixel.velocity.y == 0) {
				player.move(8, 8);
				FlxG.collide(player, mFactory, damage);
				FlxG.collide(player, scene.mapcollision);
				FlxG.collide(player, iFactory);
				player.smooth_move();
			} else { //camera transition time - moves the pixel to the next room
				player.Sprite.velocity.x = 0; 
				player.Sprite.velocity.y = 0; 
			}

			// Stops and moves the pixel to the center of the actual room
			if ((scene.pixel.velocity.y > 0 && scene.pixel.y > FlxG.worldBounds.y + scene.mapHeight/2) || 
				(scene.pixel.velocity.y < 0 && scene.pixel.y < FlxG.worldBounds.y + scene.mapHeight/2)) {
				scene.pixel.velocity.y = 0; 
				scene.pixel.y = FlxG.worldBounds.y + scene.mapHeight/2;
			}
			if ((scene.pixel.velocity.x > 0 && scene.pixel.x > FlxG.worldBounds.x + scene.mapWidth/2) ||
				(scene.pixel.velocity.x < 0 && scene.pixel.x < FlxG.worldBounds.x + scene.mapWidth/2)) {
				scene.pixel.velocity.x = 0; 
				scene.pixel.x = FlxG.worldBounds.x + scene.mapWidth/2;
			}

			// Check if the player moved to another room
				if (player.y +32 >= FlxG.worldBounds.y + scene.mapHeight) {
					player.y += 56;
					scene.changeWorldBound("down");
					player.smooth_move();
				}	
				if (player.y -16 <= FlxG.worldBounds.y) {
					player.y -= 56;
					scene.changeWorldBound("up");
					player.smooth_move();
				}
				if (player.x +32 >= FlxG.worldBounds.x + scene.mapWidth) {
					player.x += 56;
					scene.changeWorldBound("right");
					player.smooth_move();
				}	
				if (player.x -16 <= FlxG.worldBounds.x) {
					player.x -= 56;
					scene.changeWorldBound("left");
					player.smooth_move();
				}
		}
		override public function destroy():void
		{
			//	Important! Clear out the plugin otherwise resources will get messed right up after a while
			FlxControl.clear();
			
			super.destroy();
		}
		
		public function damage(player:FlxExtendedSprite, monster:FlxExtendedSprite, hp:int = 10):void
		{
			monster.kill();
			player.hurt(10);
			mFactory.addMonster(Math.floor(Math.random()* 13)+2, Math.floor(Math.random()* 9)+2);
		}
		
	}
}