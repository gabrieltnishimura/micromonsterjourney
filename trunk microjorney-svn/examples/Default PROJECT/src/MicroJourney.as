package
{
	import org.flixel.FlxGame;

	public class MicroJourney extends FlxGame
	{
		/**
		 * Quite simply this creates our FlxGame instance. Starts the game from PlayState
		 **/
		public function MicroJourney(screenWidth:int, screenHeight:int, zoom:int)
		{
				super(screenWidth, screenHeight, PlayState, zoom);
		}
	}
}