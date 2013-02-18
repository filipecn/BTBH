package;

import nme.display.StageAlign;
import nme.display.StageScaleMode;
import nme.display.Sprite;
import nme.events.Event;
import nme.events.KeyboardEvent;
import nme.Lib;
import nme.ui.Keyboard;
import org.flixel.FlxGame;
import event.Events;
import event.GameEvent;
import game.Registry;
import resource.StateLoader;

class Main extends Sprite
{
	private var registry:Registry;
	private var stateLoader:StateLoader;

	public function new () 
	{
		super();
		
		if (stage != null) 
			init();
		else 
			addEventListener(Event.ADDED_TO_STAGE, init);
	}
	
	private function init(?e:Event = null):Void 
	{
		if (hasEventListener(Event.ADDED_TO_STAGE))
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		initialize();
		
		#if (cpp || neko)
		Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUP);
		#end

		/*TRACE FLASH*/
		#if (flash9 || flash10)
			haxe.Log.trace = function(v,?pos) { untyped __global__["trace"](pos.className+"#"+pos.methodName+"("+pos.lineNumber+"):",v); }
		#elseif flash
			haxe.Log.trace = function(v,?pos) { flash.Lib.trace(pos.className+"#"+pos.methodName+"("+pos.lineNumber+"): "+v); }
		#end


		/*XML DATA*/
		stateLoader = StateLoader.getInstance();
		stateLoader.addEventListener(Events.STATES_LOADED, handleStatesLoaded);
		registry = Registry.getInstance();
		registry.init();
	}
	
	private function handleStatesLoaded(gameEvent:GameEvent):Void
	{
		var demo:FlxGame = new ProjectClass();
		addChild(demo);
	}

	#if (cpp || neko)
	private function onKeyUP(e:KeyboardEvent):Void 
	{
		if (e.keyCode == Keyboard.ESCAPE)
		{
			Lib.exit();
		}
	}
	#end
	
	private function initialize():Void 
	{
		Lib.current.stage.align = StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = StageScaleMode.NO_SCALE;

		/*DCE HANDLE!*/
		DCEHandler.handle();
	}
	
	// Entry point
	public static function main() {
		
		Lib.current.addChild(new Main());
	}	
}