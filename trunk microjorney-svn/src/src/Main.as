package
{
	import org.flixel.*; //Allows you to refer to flixel objects in your code
	[Frame(factoryClass = "Preloader")]
	public class Main extends FlxGame
	{
		public function Main():void
		{
			//Create a new FlxGame object at 272x208 with 3x pixels, then load PlayState
			super(272, 208, PlayState, 3, 60,60); 
			forceDebugger = true;		
		}
	}
}