package  
{
	import org.flixel.*;

	/**
	 * This class creates items according to their mapped positions.
	 */
	public class ItemFactory extends FlxGroup
	{		
		public function ItemFactory()
		{
			super();
		}
		
		/**
		 * Adding items
		 * @param	x x TILE coordinate of the new item
		 * @param	y y TILE coordinate of the new item
		 * @param	id Identification of the new item
		 */
		public function addItem(x:int, y:int, id:int):void
		{
			var tempItem:Item = new Item(x, y, id);
			
			add(tempItem);
		}
		
		override public function update():void
		{
			super.update();
		}
	}

}