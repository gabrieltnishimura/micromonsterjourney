package  
{
	import org.flixel.FlxSprite;
	import org.flixel.FlxG;
	import org.flixel.plugin.photonstorm.FlxExtendedSprite;
	/**
	 * ...
	 */
	public class Item extends FlxExtendedSprite
	{
		/**
		 * Given the x and y TILE coordinates, instanciates a item
		 * as in AssetsRegistry, with number ID into the game.
		 * @param	x x TILE coordinate of the item
		 * @param	y y TILE coordinate of the item
		 * @param	id id of the item you want to instanciate
		 */
		private var _id:Number;
		public var _collidingWithPlayer:Boolean;
		private var isOpen:Boolean;
		
		public function Item(x:int, y:int, id:int) 
		{
			super(x * 16, y * 16);
			
			this.loadGraphic(AssetsRegistry.treasureSheetPNG, true, false, 16, 16, false);
			this.addAnimation("blueClosed", [0], 0, false);				this.addAnimation("blueOpen", [0, 1, 2], 7, false);
			this.addAnimation("greenClosed", [3], 0, false);			this.addAnimation("greenOpen", [3, 4, 5], 7, false);
			this.addAnimation("redClosed", [6], 0, false);				this.addAnimation("redOpen", [6, 7, 8], 7, false);
			
			this.immovable = true;
			
			this._id = id;
		}
		
		override public function kill():void
		{
			super.kill();
		}
		
		override public function update():void
		{
			super.update();
			
			/* if player is touching the item */
			if (_collidingWithPlayer)
			{
				if (FlxG.keys.justPressed("X")) {
					switch (_id) {
					/* if id of item refers to the blue treasure! */
					case 2:
						if (isOpen) {
							trace("Treasure already opened, you BASTARD!");
						} else {
							play("blueOpen");
							isOpen = true;
						}
					break;
					
					/* if id of item refers to the green treasure! */
					case 3:
						if (isOpen) {
							trace("Treasure already opened, you BASTARD!");
						} else {
							play("greenOpen");
							isOpen = true;
						}
					break;
					
					/* if id of item refers to the red treasure! */
					case 4:
						if (isOpen) {
							trace("Treasure already opened, you BASTARD!");
						} else {
							play("redOpen");
							isOpen = true;
						}
					break;
					}
				}
			// if it is not colliding with player, neither is open, play a closed animation
			} else if(!isOpen) {
			if(_id == 2)
				play("blueClosed");
			else if (_id == 3)
				play("greenClosed");
			else if (_id == 4)
				play("redClosed");
				
			}
		}
		
		public function setCollidingWithPlayer(collidingWithPlayer:Boolean):void
		{
			_collidingWithPlayer = collidingWithPlayer;
		}
	}

}