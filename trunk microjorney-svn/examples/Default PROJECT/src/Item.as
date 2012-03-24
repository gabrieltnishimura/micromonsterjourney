package  
{
	import org.flixel.FlxSprite;

	public class Item extends FlxSprite
	{
		private var tempItem:Class;
		
		/**
		 * @todo [ERRROR] Dont know why, but it is not working yet
		 * Given the x and y TILE coordinates, instanciates a item
		 * as in AssetsRegistry, with number ID into the game.
		 * @param	X x TILE coordinate of the item
		 * @param	Y y TILE coordinate of the item
		 * @param	ID id of the item you want to instanc
		 */
		public function Item(X:int, Y:int, ID:int)
		{			

			//if (ID == 1) {
				//tempItem = new AssetsRegistry.blue_treasure;
			//}
			//if (ID == 2) {
				//tempItem = new AssetsRegistry.green_treasure;
			//}
			//if (ID == 3) {
				//tempItem = new AssetsRegistry.red_treasure;
			//}
			trace(X*16, Y*16, ID)
				super(X * 16, Y * 16, AssetsRegistry.red_treasure);
				solid = true;
		}
		
	}

}