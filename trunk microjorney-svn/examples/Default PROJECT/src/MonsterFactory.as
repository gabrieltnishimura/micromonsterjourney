package  
{
	import org.flixel.*;

	/**
	 * This class creates monsters according to
	 * their mapped positions.
	 */
	public class MonsterFactory extends FlxGroup
	{
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
			var tempMonster:Monster = new Monster(x, y);
				
			add(tempMonster);
		}
		
		override public function update():void
		{
			super.update();
		}
		
	}
}