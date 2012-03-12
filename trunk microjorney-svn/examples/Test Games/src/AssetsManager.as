package  
{
	/**
	 * ...
	 * @author CKoji
	 */
	public class AssetsManager 
	{
			[Embed(source = 'Untitled.png')]public static var tiles:Class;
			[Embed(source = 'tiles.png')]public static var tiles2:Class;
			[Embed(source = 'dungeon.txt', mimeType = 'application/octet-stream')]public static var dungeon:Class;
			[Embed(source = 'outdoor.txt', mimeType = 'application/octet-stream')]public static var outdoor:Class;
		
		public function AssetsManager() 
		{
		}
		
	}

}