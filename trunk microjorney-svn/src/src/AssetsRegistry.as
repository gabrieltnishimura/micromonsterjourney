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
		[Embed(source = "assets/hero/heroSwing_8f_31x31_RIGHT_LEFT_DOWN.png")] public static var heroSwingPNG:Class;
		[Embed(source = "assets/hero/mmjwalksheet.png")] public static var heroTestPNG:Class;
		
		// Monsters! The spritesheet display should be UP 16x16 LEFT 16x16 RIGHT 16x16 DOWN 16x16 (for monsters)
		[Embed(source = "assets/monsters/BLUEsubrosian_8f_16x16_UP_LEFT_RIGHT_DOWN.png")] public static var blueSubrosianPNG:Class;
		[Embed(source = "assets/monsters/GREENsubrosian_8f_16x16_UP_LEFT_RIGHT_DOWN.png")] public static var greenSubrosianPNG:Class;
		[Embed(source = "assets/monsters/ORANGEsubrosian_8f_16x16_UP_LEFT_RIGHT_DOWN.png")] public static var orangeSubrosianPNG:Class;
		[Embed(source = "assets/monsters/REDsubrosian_8f_16x16_UP_LEFT_RIGHT_DOWN.png")] public static var redSubrosianPNG:Class;
		
		// Music
		[Embed(source = "assets/music/loop1.mp3")] public static var mp3:Class;
		
		public function AssetsRegistry() 
		{
			
		}
		
	}

}