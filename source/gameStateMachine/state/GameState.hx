package gameStateMachine.state;

import nme.Assets;
import nme.geom.Rectangle;
import nme.net.SharedObject;
import org.flixel.FlxButton;
import org.flixel.FlxG;
import org.flixel.FlxPath;
import org.flixel.FlxSave;
import org.flixel.FlxSprite;
import org.flixel.FlxState;
import org.flixel.FlxText;
import org.flixel.FlxU;
import io.InputManager;
import gameStateMachine.GameStateManager;
import game.registry.GameStateRegistry;

class GameState extends FlxState
{
	private var gsr:GameStateRegistry;
	private var gsm:GameStateManager;
	
	public function new():Void
	{
		super();
	}

	override public function create():Void
	{
		#if !neko
		FlxG.bgColor = 0xff131c1b;
		#else
		FlxG.camera.bgColor = {rgb: 0x131c1b, a: 0xff};
		#end		
		FlxG.mouse.show();

		/*TEXT*/
		var txt:FlxText = new FlxText(0, 0, 360, "LEVEL (mouse click to continue)");
        add(txt);
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();
	}	

	public function setRegistry(r:Dynamic):Void
	{
		gsr = cast (r, GameStateRegistry);
	}
}