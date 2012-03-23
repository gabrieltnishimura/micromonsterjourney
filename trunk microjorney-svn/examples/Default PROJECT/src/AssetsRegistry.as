package  
{
	/**
	 * Assets Registry
	 * Here is the place to put your game's assets. Tilemaps, csv files, pngs, sprites, all here!
	 */
	public class AssetsRegistry 
	{
		//	TileMap/CSV File
		[Embed(source = "assets/mmj_tilemap.PNG")] public static var tilemapPNG:Class;
		[Embed(source = "assets/mmj_tilemap_merged.csv", mimeType = "application/octet-stream")] public static var tilemapFinalCSV:Class;
		
		// PlayerPNG
		[Embed(source = "assets/player.png")] public static var hero:Class;
		// Player facing
		[Embed(source = "assets/hero/playerDOWN.png")] public static var playerDOWN:Class;
		[Embed(source = "assets/hero/playerUP.png")] public static var playerUP:Class;
		[Embed(source = "assets/hero/playerLEFT.png")] public static var playerLEFT:Class;
		[Embed(source = "assets/hero/playerRIGHT.png")] public static var playerRIGHT:Class;
		
		// pixel for map smooth transition
		[Embed(source = "assets/pixel.png")] public static var pixel:Class;
		
		public function AssetsRegistry() 
		{
			
		}
		
	}

}