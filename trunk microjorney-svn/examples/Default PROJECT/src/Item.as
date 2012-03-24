package  
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 */
	public class Item extends FlxSprite
	{
		/**
		 * @todo [ERRROR] Dont know why, but it is not working yet
		 * Given the x and y TILE coordinates, instanciates a item
		 * as in AssetsRegistry, with number ID into the game.
		 * @param	x x TILE coordinate of the item
		 * @param	y y TILE coordinate of the item
		 * @param	id id of the item you want to instanc
		 */
		public function Item(x:int, y:int, id:int) 
		{
			super(x * 16, y * 16);
			
			if(id == 1)
				loadGraphic(AssetsRegistry.blue_treasure, true, true, 16, 16);
			
			else if (id == 2)
				loadGraphic(AssetsRegistry.green_treasure, true, true, 16, 16);
				
			else if (id == 3)
				loadGraphic(AssetsRegistry.red_treasure, true, true, 16, 16);
				
			addAnimation("open", [1, 2, 3], 12, false);
		}
		
		override public function kill():void
		{
		}
		
		public function openTreasure():void
		{
			play("open");
		}
		
		override public function update():void
		{
			super.update();
		}
		
	}

}