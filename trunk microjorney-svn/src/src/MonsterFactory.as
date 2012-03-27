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
		 * @param	isRandom if true, ignores x and y param to randomize a position
		 */
		public function addMonster(x:int, y:int, isRandom:Boolean = false):void
		{
			if (isRandom) 
			{
				x = Math.floor(Math.random() * 13) + 2;
				y = Math.floor(Math.random() * 9) + 2;
			}
			
			_x = x;			_y = y;
			var tempMonster:Monster = new Monster(x, y, AssetsRegistry.monster, 1);
			add(tempMonster);
			trace("addMonster called, lenght of mArray:["+this.members.length+"] at ("+_x*16, _y*16+")");
		}
		
		override public function update():void
		{
			super.update();
		}
	}
}