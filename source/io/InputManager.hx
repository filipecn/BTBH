package io;

import haxe.FastList;
import event.IObservable;
import event.IObserver;
import event.Events;
import org.flixel.FlxG;
import nme.events.Event;
import nme.events.KeyboardEvent;
import nme.events.MouseEvent;
import nme.events.EventDispatcher;
import event.GameEvent;

class InputManager extends EventDispatcher
{
	private static var im:InputManager = null;
	private var cs:ControlsState;

	public static function new():Void
	{
		if(im != null) throw "error: singleton!";
		super();
		cs = ControlsState.getInstance();
	}

	public static function getInstance():InputManager
	{
		if(im == null)
			im = new InputManager();
		return im;
	}

	public function keyboardUpdate():Void
	{
		var changed:Bool = false;

		for (i in 0...Definitions.KEY_CONTROLS_NUMBER) {
			if(FlxG.keys.justPressed(Controls.keys[i])){
				if(cs.updateState(i, Definitions.JUST_PRESSED))
					changed = true;
			}
			else if(FlxG.keys.justReleased(Controls.keys[i])){
				if(cs.updateState(i, Definitions.JUST_RELEASED))
					changed = true;
			}
			else if(FlxG.keys.pressed(Controls.keys[i])){
				if(cs.updateState(i, Definitions.PRESSED))
					changed = true;
			}
			else if(cs.updateState(i, Definitions.RELEASED))
					changed = true;	
		}
		if(changed)
			dispatchEvent(new GameEvent(Events.CONTROL_CHANGED));
	}

	public function mouseUpdate():Void
	{
		if(FlxG.mouse.justReleased())
			dispatchEvent(new GameEvent(Events.MOUSE_JUST_RELEASED));
	}
}