package  
{
	import org.flixel.*;

	public class MainMap extends FlxGroup
	{
		public var map:FlxTilemap;
		
		public function MainMap() 
		{
			super(1);
			// get map from assets registry class!
			map = new FlxTilemap();
			map.loadMap(new AssetsRegistry.tilemapCSV, AssetsRegistry.tilemapPNG, 16, 16, 0, 0, 1, 16);
			
			/* Map borders: the character cannot collide with those. */
			map.setTileProperties(22, FlxObject.RIGHT, null, null, 1);
			map.setTileProperties(23, FlxObject.LEFT, null, null, 1);
			map.setTileProperties(26, FlxObject.FLOOR , null, null, 1);
			map.setTileProperties(27, FlxObject.UP, null, null, 1);
			
			FlxG.camera.setBounds(0, 0, 240, 160);
			FlxG.worldBounds = new FlxRect(0, 0, 240, 160);
			
			add(map);
		}
		
	}

}