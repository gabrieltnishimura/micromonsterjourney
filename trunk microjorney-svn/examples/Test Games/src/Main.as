package 
{
	import org.flixel.*; //Allows you to refer to flixel objects in your code
	[SWF(width="480", height="320", backgroundColor="#000000")] //Set the size and color of the Flash file
	[Frame(factoryClass="Preloader")]
	public class Main extends FlxGame
	{
		public function Main()
		{
			super(480, 320, PlayState, 1); //Create a new FlxGame object at 320x640 with 2x pixels, then load PlayState
			forceDebugger = true;
		}
	}
}