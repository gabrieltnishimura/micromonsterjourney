package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;

	public class MainMap extends FlxGroup
	{
		public var map:FlxTilemap;
		public var pixel:FlxSprite;
		public var mapHeight:int;
		public var mapWidth:int;
		
		public function MainMap() 
		{
			super(1);
			// get map from assets registry class!
			map = new FlxTilemap();
			map.loadMap(new AssetsRegistry.tilemapFinalCSV, AssetsRegistry.tilemapPNG, 16, 16, 0, 0, 1, 14);
			
			//game starts from the first room! at (0,0)
			FlxG.camera.setBounds(0, 0, 480, 320);
			
			//pixel that moves the camera though rooms!
			pixel = new FlxSprite(120, 80, AssetsRegistry.pixel);
			pixel.visible = true;
			
			//Initial collision area
			FlxG.worldBounds = new FlxRect(0, 0, 240, 160);
			mapHeight = FlxG.worldBounds.height;
			mapWidth = FlxG.worldBounds.width;
			
			add(map);
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
		}		
	}

}