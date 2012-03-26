package  
{
	/**
	 * Assets Registry
	 * Here is the place to put your game's assets. Tilemaps, csv files, pngs, sprites, all here!
	 */
	public class AssetsRegistry 
	{
		//	TileMap/CSV Files
		[Embed(source = "assets/mmj_tilemap.PNG")] public static var tilemapPNG:Class;
		[Embed(source = "assets/mapCSV_LevelTiles.csv", mimeType = "application/octet-stream")] public static var tilemap_leveltilesCSV:Class;
		[Embed(source = "assets/mapCSV_CollisionTiles.csv", mimeType = "application/octet-stream")] public static var tilemap_collisiontilesCSV:Class;

		// Items TileMap/CSV Files
		[Embed(source="assets/items/blue_3f_16x16.png")] public static var blue_treasure:Class;
		[Embed(source="assets/items/green_3f_16x16.png")] public static var green_treasure:Class;
		[Embed(source="assets/items/red_3f_16x16.png")] public static var red_treasure:Class;
		[Embed(source = "assets/items_tilemap.PNG")] public static var tilemap_itemsPNG:Class;
		[Embed(source = "assets/mapCSV_items.csv", mimeType = "application/octet-stream")] public static var tilemap_itemsCSV:Class;

		// Player facing
		[Embed(source = "assets/hero/hero_DOWN_UP_LEFT_RIGHT.png")] public static var heroSheetPNG:Class;
		[Embed(source = "assets/hero/heroSwing_4f_30x28_LEFT.png")] public static var heroSwingPNG:Class;
		
		// Monster (no facing cause flash should be able to handle it)
		[Embed(source = "assets/monster.png")] public static var monster:Class;
		
		// pixel for map smooth transition
		[Embed(source = "assets/pixel.png")] public static var pixel:Class;
		
		public function AssetsRegistry() 
		{
			
		}
		
	}

}