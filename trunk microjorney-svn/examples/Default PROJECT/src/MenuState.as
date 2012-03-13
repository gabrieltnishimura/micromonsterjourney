package
{
	import org.flixel.*;

	/**
	 * This looks more complicated, but all it’s actually doing is creating a button that the user can click to start the game. 
	 * FlxStates have a function called create which you must over-ride and then fill with your code. 
	 * In our case we’ve told flixel to show the mouse pointer and create a start game button.
	 */
	public class MenuState extends FlxState
	{
		private var startButton:FlxButton;

		public function MenuState()
		{
		}

		override public function create():void
		{
			FlxG.mouse.show();
			startButton = new FlxButton(120, 90, "mmj", startGame);
			add(startButton);
		}

		private function startGame():void
		{
			FlxG.mouse.hide();
			FlxG.switchState(new PlayState);
		}
	}
}
