package
{
	import org.flixel.system.FlxPreloader;

	public class Preloader extends FlxPreloader
		{
		public function Preloader():void
		{
			className = "Main";
			/* change this if you think the preloader is taking to long or is too short! 
			 * since the game is still little, you can't see the preloader yet.*/
			minDisplayTime = 10;
			super();

		}
	}
}