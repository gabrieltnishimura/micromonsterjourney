package  
{
	/**
	 * Assets Registry
	 * Here is the place to put your game's assets. Tilemaps, csv files, pngs, sprites, all here!
	 */
	public class AssetsRegistry 
	{
		//	TileMap/CSV Files
		[Embed(source = "assets/mapPNG_LevelTiles.PNG")] public static var tilemapPNG:Class;
		[Embed(source = "assets/mapCSV_LevelTiles.csv", mimeType = "application/octet-stream")] public static var tilemap_leveltilesCSV:Class;
		[Embed(source = "assets/mapCSV_CollisionTiles.csv", mimeType = "application/octet-stream")] public static var tilemap_collisiontilesCSV:Class;

		// Items TileMap/CSV Files	
		[Embed(source = "assets/items/treasure_9f_16x16.png")] public static var treasureSheetPNG:Class;
		[Embed(source = "assets/mapCSV_entities.csv", mimeType = "application/octet-stream")] public static var tilemap_entitiesCSV:Class;

		// Player facing
		[Embed(source = "assets/hero/hero_DOWN_UP_LEFT_RIGHT.png")] public static var heroSheetPNG:Class;
		[Embed(source = "assets/hero/heroSwing_4f_30x28_LEFT.png")] public static var heroSwingPNG:Class;
		[Embed(source = "assets/hero/mmjwalksheet.png")] public static var heroTestPNG:Class;
		
		// Monster (no facing cause flash should be able to handle it)
		[Embed(source = "assets/monsters/monster.png")] public static var monster:Class;

		public function AssetsRegistry() 
		{
			
		}
		
	}

}