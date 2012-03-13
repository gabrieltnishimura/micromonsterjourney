package  
{
	/**
	 * Assets Registry
	 * Here is the place to put your game's assets. Tilemaps, csv files, pngs, sprites, all here!
	 */
	public class AssetsRegistry 
	{
		//	TileMap/CSV File
		[Embed(source = "map/mmj_tilemap2.csv", mimeType = "application/octet-stream")]public static var tilemapCSV:Class;
		[Embed(source = "map/mmj_tilemap.PNG")] public static var tilemapPNG:Class;
		[Embed(source = "map/player.png")] public static var hero:Class;
		public function AssetsRegistry() 
		{
			
		}
		
	}

}