package
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	
	public class PlayState extends FlxState
	{
		private var player:Char;
		private var scene:MainMap;
		private var changingWorlds:Boolean;
		private var changedWorlds:Boolean;
		
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
				player = new Char(2, 2);
				player.elasticity = 0.8;
			/* map instance here */
				scene = new MainMap;
			/* music instance here */
				var music:FlxSound = new FlxSound();
				music.loadEmbedded(AssetsRegistry.mp3, true, false);
			//	Bring up the Flixel debugger if you'd like to watch these values in real-time
			
			/*[DEBUG] watch player sprite coordinates*/
			FlxG.watch(player.Sprite, "x", "Player X coord");			FlxG.watch(player.Sprite, "y", "Player Y coord");
			
			/*[DEBUG] watch pixel coordinates and velocity*/
			//FlxG.watch(scene.pixel, "x", "Pixel X coord");				FlxG.watch(scene.pixel, "y", "Pixel Y coord");
			//FlxG.watch(scene.pixel.velocity, "x", "Pixel VelocityX");	FlxG.watch(scene.pixel.velocity, "y", "Pixel VelocityY");
			
			/*[DEBUG] watch player health*/
			FlxG.watch(player, "health", "health");
			
			/*[DEBUG] number of monsters*/
			FlxG.watch(scene.mFactory, "length", "Monsters!");
			
			// adding stuff to the screen. First we have all the level of the game (scene.*)
			add(scene.map); 				add(scene.pixel);
			add(scene.mFactory); //monster factory
			add(scene.mFactory.SpriteFactory); //collidable monster factory
			add(scene.iFactory);
			// then we have the player related stuff
			add(player); 		add(player.Sprite);
			add(player.Attack);	add(player.Border);	
			
			//notice that the collision should be added last
			add(scene.mapcollision); 
			
			//starts music
			music.play();
			
			FlxG.mouse.show();
		}
		
		/*bad processing here - maybe not!*/
		override public function update():void
		{
			super.update();	
			
				if (changedWorlds) {
					scene.instanciatesLiveEntities();
					changedWorlds = false;
				}
				
			if (scene.pixel.velocity.x == 0 && scene.pixel.velocity.y == 0) {
				// Snapped Movement (8x8) of the virtual sprite HERE!
				player.move(8, 8);
				// this part of the code is related to what it seems to be the tilemap and static objects, like stones
				FlxG.collide(player, scene.mapcollision);
				FlxG.collide(scene.mFactory, scene.mapcollision);
				//FlxG.collide(player, scene.mFactory, damagePlayerOnly);
				FlxG.collide(player, scene.iFactory);
				FlxG.collide(scene.mFactory, scene.mFactory);
				//FlxG.collide(scene.mFactory.SpriteFactory, player);
				//FlxG.collide(scene.mFactory, player);
				
				/**
				 * @todo Monster is not colliding with item correctly!! Test left border of green treasure
				 */
				FlxG.collide(scene.mFactory, scene.iFactory);
				
				/* here we have the collision check: of the player with the monster */
				for each (var monster:Monster in scene.mFactory.members)
				{
					if (FlxCollision.pixelPerfectCheck(player, monster))
					{
						if (player.x >= monster.x && player.y <= monster.y + 15 && player.y >= monster.y - 15) // Right Side
						{
							trace("Right Side");
							player.x += 16;
							player.smooth_move();
						}
						else if (player.x <= monster.x && player.y <= monster.y + 15 && player.y >= monster.y - 15) // Left Side
						{
							trace("Left Side");
							player.x -= 16;
							player.smooth_move();
						}
						else if (player.y >= monster.y && player.x <= monster.x + 15 && player.x >= monster.x - 15) // Bottom Side
						{
							trace("Top Side");
							player.y += 16;
							player.smooth_move();
						}
						else if (player.y <= monster.y && player.x <= monster.x + 15 && player.x >= monster.x - 15) // Top Side
						{
							trace("Bottom Side");
							player.y -= 16;
							player.smooth_move();
						}
					}
				}
				/* here we have the collision check: of the attack animation with the monster */
				for each (var monster:Monster in scene.mFactory.members)
				{
						if (FlxCollision.pixelPerfectCheck(player.Attack, monster) && player.Attack.exists == true)
						{
							monster.gotHitByPlayer(player);
							monster.kill();
						}
				}
				/* sweeps for all the items and checks whether the char is colliding with the bottom part of the item */
					for each (var item:Item in scene.iFactory.members)
					{
						if (FlxCollision.pixelPerfectCheck(player.Border, item) && player.facing == FlxObject.UP) 
						{
							item.setCollidingWithPlayer(true);
						} else{
								item.setCollidingWithPlayer(false);
						}
					}
				// HERE is where the player sprite moves to the virtual sprite location
				player.smooth_move();
				
			} else { //camera transition time - moves the pixel to the next room
				player.Sprite.velocity.x = 0;
				player.Sprite.velocity.y = 0;
			}

			// Stops and moves the pixel to the center of the actual room
			if ((scene.pixel.velocity.y > 0 && scene.pixel.y > FlxG.worldBounds.y + scene.mapHeight/2) || 
				(scene.pixel.velocity.y < 0 && scene.pixel.y < FlxG.worldBounds.y + scene.mapHeight/2)) {
				scene.pixel.velocity.y = 0; 
				scene.pixel.y = FlxG.worldBounds.y + scene.mapHeight / 2;
			}
			if ((scene.pixel.velocity.x > 0 && scene.pixel.x > FlxG.worldBounds.x + scene.mapWidth/2) ||
				(scene.pixel.velocity.x < 0 && scene.pixel.x < FlxG.worldBounds.x + scene.mapWidth/2)) {
				scene.pixel.velocity.x = 0; 
				scene.pixel.x = FlxG.worldBounds.x + scene.mapWidth / 2;
			}

			// Check if the player moved to another room
				if (player.y +32 >= FlxG.worldBounds.y + scene.mapHeight) {
					player.y += 56;
					scene.changeWorldBound("down");
					player.smooth_move();
					changingWorlds = true;
				}	
				if (player.y -16 <= FlxG.worldBounds.y) {
					player.y -= 56;
					scene.changeWorldBound("up");
					player.smooth_move();
					changingWorlds = true;
				}
				if (player.x +32 >= FlxG.worldBounds.x + scene.mapWidth) {
					player.x += 56;
					scene.changeWorldBound("right");
					player.smooth_move();
					changingWorlds = true;
				}	
				if (player.x -16 <= FlxG.worldBounds.x) {
					player.x -= 56;
					scene.changeWorldBound("left");
					player.smooth_move();
					changingWorlds = true;
				}
				if (changingWorlds == true && player.Sprite.x == player.x && player.Sprite.y == player.y &&
					player.Sprite.velocity.x == 0 && player.Sprite.velocity.y == 0 &&
					scene.pixel.velocity.x == 0 && scene.pixel.velocity.y == 0)
					{
						changedWorlds = true;
					}
		}
		override public function destroy():void
		{
			//	Important! Clear out the plugin otherwise resources will get messed right up after a while
			FlxControl.clear();
		 	
			super.destroy();
		}
		
		private function damagePlayerOnly(player:FlxExtendedSprite, monster:FlxExtendedSprite):void
		{
			monster.kill();
			player.hurt(10);
			scene.mFactory.addMonster(0, 0, true, 11)
		}
	}
}