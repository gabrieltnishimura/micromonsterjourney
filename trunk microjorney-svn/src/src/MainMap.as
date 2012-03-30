package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;

	public class MainMap extends FlxGroup
	{
		/**
		 * @todo Fix this crappy all's PUBLIC thing.
		 */
		public var map:FlxTilemap; // playstate needs this
		public var pixel:FlxSprite; // playstate needs this
		public var mapcollision:FlxTilemap; // playstate needs this
		public var mapHeight:int = 208; // playstate needs this
		public var mapWidth:int = 272; // playstate needs this
		public var mFactory:MonsterFactory; // playstate needs this
		public var iFactory:ItemFactory; // playstate needs this

		public function MainMap() 
		{
			super();
			// get map from assets registry class! no collision blocks: that is why there's a 1000 as collision index
			map = new FlxTilemap();
			map.loadMap(new AssetsRegistry.tilemap_leveltilesCSV, AssetsRegistry.tilemapPNG, 16, 16, 0, 0, 1, 1000);
			// get collision tilemaps from assets registry class!
			mapcollision = new FlxTilemap();
			mapcollision.loadMap(new AssetsRegistry.tilemap_collisiontilesCSV, AssetsRegistry.tilemapPNG, 16, 16);
			
			//game starts from the first room! at (0,0)
			FlxG.camera.setBounds(0, 0, 544, 416);
			
			//pixel that moves the camera though rooms!			
			pixel = new FlxSprite(120, 80);
			pixel.makeGraphic(1, 1, 0xFF000000);
			pixel.visible = false;
			
			//Initial collision area
			FlxG.worldBounds = new FlxRect(0, 0, mapWidth, mapHeight);
			
			// Factories!
				iFactory = new ItemFactory;
				mFactory = new MonsterFactory;
				
			instanciatesLiveEntities();
			
			parseItems();
		}
		
		/**
		 * Moves camera to next room, depending on the direction
		 * received as parameter.
		 * @param	direction Direction of the next room.
		 */
		public function changeWorldBound(direction:String):void {
			//Camera follows pixel Sprite so that when it moves, the camera moves along with it
			FlxG.camera.follow(pixel);
			
			if(direction=="down") {
				FlxG.worldBounds = new FlxRect(FlxG.worldBounds.x, FlxG.worldBounds.y + mapHeight, mapWidth, mapHeight);
			}
			
			if(direction=="up") {
				FlxG.worldBounds = new FlxRect(FlxG.worldBounds.x, FlxG.worldBounds.y - mapHeight, mapWidth, mapHeight);
			}
			
			/* pixel moves towards the center of the next room */
			if(direction=="up" || direction=="down") {
				FlxVelocity.moveTowardsPoint(pixel, new FlxPoint(FlxG.worldBounds.x + mapWidth, FlxG.worldBounds.y + mapHeight / 2), 200);
			}
			
			if(direction=="right") {
				FlxG.worldBounds = new FlxRect(FlxG.worldBounds.x + mapWidth, FlxG.worldBounds.y, mapWidth, mapHeight);
			}
			
			if(direction=="left") {
				FlxG.worldBounds = new FlxRect(FlxG.worldBounds.x - mapWidth, FlxG.worldBounds.y, mapWidth, mapHeight);
			}
			
			/* pixel moves towards the center of the next room */
			if(direction=="right" || direction=="left") {
				FlxVelocity.moveTowardsPoint(pixel, new FlxPoint(FlxG.worldBounds.x + mapWidth / 2, FlxG.worldBounds.y + mapHeight), 200);
			}
			
			/* Adds up the second map layer: it contains all items and stuff*/
		}
		
		
		/**
		 * This function shows all the treasures on the map!
		 * It loads the tilemap of entities and sweeps through it till it find not 0 tiles.
		 * Those tiles are for instance, treasures. For 
		 */
		private function parseItems():void
		{
			var entitiesMap:FlxTilemap = new FlxTilemap();
			entitiesMap.loadMap(new AssetsRegistry.tilemap_entitiesCSV, 
			/* this can be ignored */ AssetsRegistry.tilemapPNG, 16, 16, 0, 0, 1, 1);
			
			for (var ty:int = 0; ty < entitiesMap.heightInTiles; ty++)
			{
				for (var tx:int = 0; tx < entitiesMap.widthInTiles; tx++)
				{
					/* all tiles that are not 0 are items or objects*/
					if (entitiesMap.getTile(tx, ty) != 0 && entitiesMap.getTile(tx, ty) != 1
					&&  entitiesMap.getTile(tx, ty) <= 10)
					{
					//[DEBUGING parser]
					//trace("Tile No:[" + itemsMap.getTile(tx, ty) + "] Coord:(" + tx + "," + ty + ")");
						iFactory.addItem(tx, ty, entitiesMap.getTile(tx, ty));
					}
				}
			}
		}
		
		/**
		 * This function instanciates all live entities from the CSV entities file.
		 * It only creates things on the current map of the player. So that
		 * there is no need to instanciates 
		 */
		public function instanciatesLiveEntities():void
		{
			var entitiesMap:FlxTilemap = new FlxTilemap();
			entitiesMap.loadMap(new AssetsRegistry.tilemap_entitiesCSV, 
			/* this can be ignored */ AssetsRegistry.tilemapPNG, 16, 16, 0, 0, 1, 1);
			
			for (var ty:int = 0; ty < entitiesMap.heightInTiles; ty++)
			{
				for (var tx:int = 0; tx < entitiesMap.widthInTiles; tx++)
				{
					/* tiles bigger than 10 */
					if (entitiesMap.getTile(tx, ty) > 10)
					{
					//[DEBUGING parser]
					//trace("LEFT:["+FlxG.worldBounds.left+"] RIGHT: ["+FlxG.worldBounds.right+"]\nTOP: ["+FlxG.worldBounds.top+"] BOTTON:["+FlxG.worldBounds.bottom+"]");
					//trace("Tile No:[" + itemsMap.getTile(tx, ty) + "] Coord:(" + tx + "," + ty + ")")
					if ((tx >= (FlxG.worldBounds.left / 16) && tx < (FlxG.worldBounds.right / 16)) &&
					(ty >= (FlxG.worldBounds.top / 16) && ty < (FlxG.worldBounds.bottom / 16)))
						 {
							mFactory.addMonster(tx, ty, false, entitiesMap.getTile(tx, ty));
						 }
					}
				}
			}
		}
	}
}