package
{
	import flash.display.Sprite;
	import flash.events.Event;

	[Frame(factoryClass = "Preloader")]
	/**
	 * This is the default file as created by FlashDevelop, with two extra lines. 
	 * It waits for the pre-loader to have finished and then it creates a new local variable called game, which is an instance of the FirstGame class. 
	 * This is then added to the display list. In short, it’s just made your flixel game visible.
	 **/
	public class Main extends Sprite
	{
		public function Main():void
		{
			if (stage)
			{
				init();
			} else {
				addEventListener(Event.ADDED_TO_STAGE, init);
			}
		}

		/**
		 * A example of a more modular code would be a game constructor that support both playstate and menustate,
		 * not 2 classes - one for PlayState and another for MenuState
		 */
		private function init(e:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
	
			/* Starting game directly from PlayState with width of 240, height of 160 and 3x zoom */
			var game:MicroJourney = new MicroJourney(240, 160, 3);
			
			addChild(game);
		}
	}
}