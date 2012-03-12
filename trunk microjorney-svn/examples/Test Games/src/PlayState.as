package
{
	import flash.display.BitmapData;
	import flash.events.ActivityEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import Map;
	import org.flixel.system.FlxTile;
 
	public class PlayState extends FlxState
	{	
	
		private var ship:Char;
		private var camera:FlxCamera;
		private var map:Map;
		override public function create():void
		{
			if (FlxG.getPlugin(FlxControl) == null)
			{
			FlxG.addPlugin(new FlxControl);
			}
			FlxG.bgColor = 0xffaaaaaa;
			
			//nao sei pq nao funciona sem isso
			map = new Map();
			
			//coloquei pra debug
			//text = new FlxText(0, 0, 100, "Hello World"); //adds a 100px wide text field at position 0,0 (top left)
			
			//instancia o personagem
			ship = new Char(map.GetCenterX() - 8, map.GetCenterY() - 8);
			//à melhorar funcao
			ship.CreateChar();
			
			//adiciona os controles basicos do personagem mas nao tem snap (movimento contínuo)
			//FlxControl.create(ship, FlxControlHandler.MOVEMENT_INSTANT, FlxControlHandler.STOPPING_INSTANT);
			//FlxControl.player1.setCustomKeys("W", "S", "A", "D");
			//FlxControl.player1.setStandardSpeed(200, false);
			
			//instancia a camera que vai seguir o personagem
			camera = new FlxCamera(0, 0, 240, 160, 2);
			camera.setBounds(0, 0, FlxG.width, FlxG.height);
			
			add (map.worldmap);
			add (ship);
			add (ship.Sprite);
			
			//adiciona a camera que vai seguir o personagem duh
			FlxG.addCamera(camera);
			//super.create();
			FlxG.mouse.show();
			trace (ship.y);
		}
		
		override public function update():void
		{
			super.update();
			//var i:int;
			ship.Move(8, 8);
			//if (ship.x > 2 && ship.x<4) i = 2;
			map.ChangeMap(ship, camera);
			/*var lol:FlxTileblock = new FlxTileblock(210, 65, 30, 30);
			i = FlxG.collide(ship, lol, FlxG.overlap);*/
			FlxG.collide(ship, map.worldmap);
			//FlxG.collide(ship, map.map2);
		}
		//override public function preUpdate():void 
		//{
			//super.preUpdate();
			//matriz.Snap(ship, 8, 8);
		//}
		//
		override public function destroy():void
		{
		// Important! Clear out the plugin otherwise resources will get messed right up after a while
		FlxControl.clear();

		super.destroy();
		}
	}
}