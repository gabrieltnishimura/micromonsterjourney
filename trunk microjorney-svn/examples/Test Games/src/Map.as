package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import AssetsManager;
	/**
	 * ...
	 * @author CKoji
	 */
	public class Map
	{
		
		private static var _tilex:Number = 2;
		private static var _tiley:Number = 2;
		private static var _mapnumber:Number = 2
		
		public var x:Number = 0;
		public var y:Number = 0;
		public var z:Number = 0;
		public var mapwidth:Number = 240;
		public var mapheight:Number = 160;
		public var worldmap:FlxGroup;
		public var map:FlxTilemap;
		public var map2:FlxTilemap;
		
		public function Map()
		{
			//x = x of the map
			//y = y of the map
			//z = dungeon
			worldmap = new FlxGroup(_mapnumber);
			
			map = new FlxTilemap();
			map.loadMap(new AssetsManager.outdoor(), AssetsManager.tiles, 16, 16, FlxTilemap.OFF, 0, 1, 18);
			map.setTileProperties(5, FlxObject.ANY);
			worldmap.add(map);
			map2 = new FlxTilemap();
			map2.loadMap(new AssetsManager.dungeon(), AssetsManager.tiles2, 16, 16, FlxTilemap.OFF, 0, 1, 20);
			worldmap.add(map2);
		}
		
		public function GetX():Number
		{
			var result:Number;
			result = x * mapwidth;
			result += z;
			return result;
		}
		public function GetCenterX():Number
		{
			var result:Number;
			result = x * mapwidth + mapwidth / 2;
			result += z;
			return result;
		}
		public function GetY():Number
		{
			var result:Number;
			result = y * mapheight;
			result += z;
			return result;
		}
		public function GetCenterY():Number
		{
			var result:Number;
			result = y * mapheight + mapheight / 2;
			result += z;
			return result;
		}
		public function GetZ():Number
		{
			var result:Number;
			result = z;
			return result;
		}
		public function GetPosition():FlxPoint
		{
			var result:FlxPoint;
			result = new FlxPoint(GetX(), GetY());
			return result;
		}
		public function GetCenter():FlxPoint
		{
			var result:FlxPoint;
			result = new FlxPoint(GetCenterX(), GetCenterY());
			return result;
		}
		public function GetTop():Number
		{
			var result:Number;
			result = GetY() + 8;
			return result;
		}
		public function GetBot():Number
		{
			var result:Number;
			result = GetY() + mapheight - 24;
			return result;
		}
		public function GetLeft():Number
		{
			var result:Number;
			result = GetX() + 8;
			return result;
		}
		public function GetRight():Number
		{
			var result:Number;
			result = GetX() + mapwidth - 24;
			return result;
		}
		public function ChangeMap (Char:FlxExtendedSprite, camera:FlxCamera):void
		{
			var i:int;
			i = Test(Char);
			switch(i)
			{
				case 1://left
					if (x > 0)
					{
					x -= 1;
					Char.x = GetRight();
					camera.focusOn(GetCenter());
					trace(x, y);
					trace(Char.x, Char.y);
					}
					break;
				
				case 2://right
					if (x < _tilex - 1)
					{
					x += 1;
					Char.x = GetLeft();
					camera.focusOn(GetCenter());
					trace(x, y);
					trace(Char.x, Char.y);
					}
					break;
				case 3://top
					if (y > 0)
					{
					y -= 1;
					Char.y = GetBot();
					camera.focusOn(GetCenter());
					trace(x, y);
					trace(Char.x, Char.y);
					}
					break;
				
				case 4://bot
					if (y < _tiley - 1)
					{
					y += 1;
					Char.y = GetTop();
					camera.focusOn(GetCenter());
					trace(x, y);
					trace(Char.x, Char.y);
					}
					break;
					
				default:
					break;
			}
		}
		public function Test(Char:FlxExtendedSprite):int
		{
			//left = 1
			//right =2
			//top = 3
			//bottom 4
			var result:FlxGroup = new FlxGroup(2);
			var i:int = 0;
			var j:int = 0;
			var test:FlxGroup;
			test = CreateInvisiWall(1);
			for (i = 1; i <= 4; i++)
			{
				if (FlxG.collide(Char, test.members.shift()))
				{
					//result.add(i);
					break;
				}
			}
			return i;
		}
				
		public function CreateInvisiWall(thickness:uint = 2):FlxGroup
		{
			//Completamente ligado à classe custom Map
			//Um pouco adaptado da função flxcamera.createCameraWall()
			var left:FlxTileblock;
			var right:FlxTileblock;
			var top:FlxTileblock;
			var bottom:FlxTileblock;
			left = new FlxTileblock(GetX(), GetY() + thickness, thickness, mapheight - (thickness * 2));
			right = new FlxTileblock(GetX() + mapwidth - thickness, GetY() + thickness, thickness, mapheight - (thickness * 2));
			top = new FlxTileblock(GetX(), GetY(), mapwidth, thickness);
			bottom = new FlxTileblock(GetX(), GetY() + mapheight - thickness, mapwidth, thickness);
			var result:FlxGroup = new FlxGroup(4);
			result.add(left);
			result.add(right);
			result.add(top);
			result.add(bottom);
			return result;
		}
		
	}

}