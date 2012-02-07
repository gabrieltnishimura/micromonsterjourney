package  
{
	import org.flixel.FlxPoint;
	/**
	 * ...
	 * @author CKoji
	 */
	public class Matriz 
	{
		public var x:Number = 0;
		public var y:Number = 0;
		public var z:Number = 0;
		public var mapwidth:Number = 240;
		public var mapheight:Number = 160;
		
		public function Matriz() 
		{
			//x = x of the map
			//y = y of the map
			//z = dungeon
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
			result = GetY() + 2;
			return result;
		}
		public function GetBot():Number
		{
			var result:Number;
			result = GetY() + mapheight - 18;
			return result;
		}
		public function GetLeft():Number
		{
			var result:Number;
			result = GetX() + 2;
			return result;
		}
		public function GetRight():Number
		{
			var result:Number;
			result = GetX() + mapwidth - 18;
			return result;
		}
	}

}