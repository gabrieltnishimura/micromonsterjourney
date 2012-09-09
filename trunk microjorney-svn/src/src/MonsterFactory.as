package  
{
	import flash.text.engine.BreakOpportunity;
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
		public static var sprite:Class;
		public var SpriteFactory:FlxGroup;
		
		public function MonsterFactory()
		{
			super();
			SpriteFactory = new FlxGroup();
		}
		
		/**
		 * Adds a monster with AI to the map
		 * @param	x x TILE coordinate of the new monster
		 * @param	y y TILE coordinate of the new monster
		 * @param	isRandom if true, ignores x and y param to randomize a position
		 * @param	id identification number of the monster: 11 = RED, 12 = BLUE, 13 = GREEN, 14 = ORANGE
		 */
		public function addMonster(x:int, y:int, isRandom:Boolean, id:Number):void
		{
			if (isRandom) 
			{
				x = Math.floor(Math.random() * 13) + 2;
				y = Math.floor(Math.random() * 9) + 2;
			}
			
			_x = x;			_y = y;
			if (id == 11)
				sprite = AssetsRegistry.redSubrosianPNG;
			else if (id == 12)
				sprite = AssetsRegistry.blueSubrosianPNG;
			else if (id == 13)
				sprite = AssetsRegistry.greenSubrosianPNG;
			else if (id == 14)
				sprite = AssetsRegistry.orangeSubrosianPNG;
				
				var tempMonster:Monster = new Monster(x, y, sprite, 1, 1);

				
			add(tempMonster);	
			SpriteFactory.add(tempMonster.Sprite);
			
			/**
			 * Guess if it does not pass through this line it means sprites are being recycled.
			 */
			trace("addMonster called, lenght of mArray:["+this.length+"] at ("+_x*16, _y*16+")");
		}
		
		override public function update():void
		{
			for each(var monster:Monster in this.members) {
				if (monster._isDead) {
					
				}
			}
			super.update();
		}
	}
}