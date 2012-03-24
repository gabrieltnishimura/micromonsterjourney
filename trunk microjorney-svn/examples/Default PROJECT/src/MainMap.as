package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;

	public class MainMap extends FlxGroup
	{
		public var map:FlxTilemap;
		public var pixel:FlxSprite;
		public var mapcollision:FlxTilemap;
		public var mapHeight:int = 208;
		public var mapWidth:int = 272;
		public var items:FlxGroup;

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
			pixel = new FlxSprite(120, 80, AssetsRegistry.pixel);
			pixel.visible = false;
			
			//Initial collision area
			FlxG.worldBounds = new FlxRect(0, 0, mapWidth, mapHeight);
			
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
			
			if(direction=="up" || direction=="down") {
				FlxVelocity.moveTowardsPoint(pixel, new FlxPoint(FlxG.worldBounds.x + mapWidth, FlxG.worldBounds.y + mapHeight / 2), 200);
			}
			
			if(direction=="right") {
				FlxG.worldBounds = new FlxRect(FlxG.worldBounds.x + mapWidth, FlxG.worldBounds.y, mapWidth, mapHeight);
			}
			
			if(direction=="left") {
				FlxG.worldBounds = new FlxRect(FlxG.worldBounds.x - mapWidth, FlxG.worldBounds.y, mapWidth, mapHeight);
			}
			
			if(direction=="right" || direction=="left") {
				FlxVelocity.moveTowardsPoint(pixel, new FlxPoint(FlxG.worldBounds.x + mapWidth / 2, FlxG.worldBounds.y + mapHeight), 200);
			}
			
			/* Adds up the second map layer: it contains all items and stuff*/
		}
		
		
		/**
		 * This function shows all the treasures on the map!
		 */
		private function parseItems():void
		{
			var itemsMap:FlxTilemap = new FlxTilemap();
			var items:FlxGroup  = new FlxGroup();
			itemsMap.loadMap(new AssetsRegistry.tilemap_itemsCSV, AssetsRegistry.tilemap_itemsPNG, 16, 16, 0, 0, 1, 1);
			
			for (var ty:int = 0; ty < itemsMap.heightInTiles; ty++)
			{
				for (var tx:int = 0; tx < itemsMap.widthInTiles; tx++)
				{
					/* all tiles that are not 0 are items*/
					if (itemsMap.getTile(tx, ty) != 0)
					{
					trace("Tile No:[" + itemsMap.getTile(tx, ty) + "] Coord:(" + tx + "," + ty + ")");
						items.add(new Item(tx, ty, itemsMap.getTile(tx, ty)));
					}
				}
			}
			
			
		}
	}
}