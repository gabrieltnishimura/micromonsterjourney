package
{
	import flash.display.BitmapData;
	import flash.events.ActivityEvent;
	import flash.events.Event;
	import flash.events.EventDispatcher;
	import org.flixel.*;
	import org.flixel.plugin.photonstorm.*;
	import Matriz;
	import org.flixel.system.FlxTile;
 
	public class PlayState extends FlxState
	{	
		[Embed(source = 'Untitled.png')]private static var tiles:Class;
		[Embed(source = 'mapz.txt', mimeType = 'application/octet-stream')]private static var mapz:Class;
		
		private static var _tilex:Number = 2;
		private static var _tiley:Number = 2;
		
		private var ship:FlxExtendedSprite;
		private var camera:FlxCamera;
		private var tile:FlxExtendedSprite;
		private var tile2:FlxExtendedSprite;
		private var door:FlxExtendedSprite;
		private var which:Number;
		private var map:FlxTilemap;
		private var matriz:Matriz;
		override public function create():void
		{
			if (FlxG.getPlugin(FlxControl) == null)
			{
			FlxG.addPlugin(new FlxControl);
			}
			FlxG.bgColor = 0xffaaaaaa;
			which = 1;
			
			//nao sei pq nao funciona sem isso
			matriz = new Matriz();
			
			//coloquei pra debug
			//teste = new FlxText(0, 0, 100, "Hello, World!"); //adds a 100px wide text field at position 0,0 (top left)
			
			//instancia o personagem
			ship = new FlxExtendedSprite(matriz.GetCenterX() - 8, matriz.GetCenterY() - 8);
			ship.makeGraphic(16, 16, 0xFF0000FF);
			
			//adiciona os controles basicos do personagem
			FlxControl.create(ship, FlxControlHandler.MOVEMENT_INSTANT, FlxControlHandler.STOPPING_INSTANT);
			//FlxControl.player1.setCustomKeys("W", "S", "A", "D");
			FlxControl.player1.setStandardSpeed(200, false);
			
			//instancia a camera que vai seguir o personagem
			camera = new FlxCamera(0, 0, 240, 160, 2);
			camera.setBounds(0, 0, FlxG.width, FlxG.height);
			
			map = new FlxTilemap();
			map.loadMap(new mapz(), tiles, 16, 16, FlxTilemap.OFF, 0, 1, 18);
			map.setTileProperties(5, FlxObject.ANY);
			
			add (map);
			add(ship);
			
			//adiciona a camera que vai seguir o personagem duh
			FlxG.addCamera(camera);
			//super.create();
			FlxG.mouse.show();
		}
		
		override public function update():void
		{
			super.update();
			var i:int;
			//if (ship.x > 2 && ship.x<4) i = 2;
			i = test();
			/*var lol:FlxTileblock = new FlxTileblock(210, 65, 30, 30);
			i = FlxG.collide(ship, lol, FlxG.overlap);*/
			FlxG.collide(ship, map)
			switch(i)
			{
				case 1://left
					if (matriz.x > 0)
					{
					matriz.x -= 1;
					ship.x = matriz.GetRight();
					camera.focusOn(matriz.GetCenter());
					trace(matriz.x, matriz.y);
					trace(ship.x, ship.y);
					}
					break;
				
				case 2://right
					if (matriz.x < _tilex - 1)
					{
					matriz.x += 1;
					ship.x = matriz.GetLeft();
					camera.focusOn(matriz.GetCenter());
					trace(matriz.x, matriz.y);
					trace(ship.x, ship.y);
					}
					break;
				case 3://top
					if (matriz.y > 0)
					{
					matriz.y -= 1;
					ship.y = matriz.GetBot();
					camera.focusOn(matriz.GetCenter());
					trace(matriz.x, matriz.y);
					trace(ship.x, ship.y);
					}
					break;
				
				case 4://bot
					if (matriz.y < _tiley - 1)
					{
					matriz.y += 1;
					ship.y = matriz.GetTop();
					camera.focusOn(matriz.GetCenter());
					trace(matriz.x, matriz.y);
					trace(ship.x, ship.y);
					}
					break;
					
				default:
					break;
			}
		}
		override public function destroy():void
		{
		// Important! Clear out the plugin otherwise resources will get messed right up after a while
		FlxControl.clear();

		super.destroy();
		}
		private function test():int
		{
			//left = 1
			//right =2
			//top = 3
			//bottom 4
			var i:int;
			var test:FlxGroup;
			test = createInvisiWall(matriz, 1);
			for (i = 1; i <= 4; i++)
			{
				if (FlxG.collide(ship, test.members.shift()))
				break;
			}
			test.destroy();
			return i;
		}
		
		public static function createInvisiWall(matriz:Matriz, thickness:uint = 1):FlxGroup
		{
			//Completamente ligado à classe custom Matriz
			var left:FlxTileblock;
			var right:FlxTileblock;
			var top:FlxTileblock;
			var bottom:FlxTileblock;
			left = new FlxTileblock(matriz.GetX(), matriz.GetY() + thickness, thickness, matriz.mapheight - (thickness * 2));
			right = new FlxTileblock(matriz.GetX() + matriz.mapwidth - thickness, matriz.GetY() + thickness, thickness, matriz.mapheight - (thickness * 2));
			top = new FlxTileblock(matriz.GetX(), matriz.GetY(), matriz.mapwidth, thickness);
			bottom = new FlxTileblock(matriz.GetX(), matriz.GetY() + matriz.mapheight - thickness, matriz.mapwidth, thickness);
			var result:FlxGroup = new FlxGroup(4);
			result.add(left);
			result.add(right);
			result.add(top);
			result.add(bottom);
			
			return result;
		}
		
	}
}