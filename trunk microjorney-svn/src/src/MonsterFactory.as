package  
{
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.FlxExtendedSprite;

	/**
	 * This class creates monsters according to
	 * their mapped positions.
	 */
	public class MonsterFactory extends FlxGroup
	{
		private var _x:int;
		private var _y:int;
		
		public function MonsterFactory()
		{
			super();
		}
		
		/**
		 * Adds a monster with AI to the map
		 * @param	x x TILE coordinate of the new monster
		 * @param	y y TILE coordinate of the new monster
		 */
		public function addMonster(x:int, y:int):void
		{
			trace("addMonster called, lenght of mArray:["+this.length+"]");
			_x = x;			_y = y;
			trace(_x*16, _y*16);
			var tempMonster:Monster = new Monster(x, y, AssetsRegistry.monster, 1);
			add(tempMonster);
		}
		
		override public function update():void
		{
			super.update();
		}
		
		public function getPositionX():int 
		{			return _x*16;			}
		public function getPositionY():int 
		{			return _y * 16;			}
	}
}