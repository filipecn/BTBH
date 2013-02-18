package io;

import org.flixel.FlxG;

class ControlsState
{
	private var controls:Array<Int>;

	private static var cs:ControlsState = null;

	public static function new():Void
	{
		if(cs != null) throw "Error: ControlsState singleton!";

		controls = new Array<Int>();
		for (i in 0...Definitions.KEY_CONTROLS_NUMBER) 
			controls.push(Definitions.RELEASED);
	}

	public static function getInstance():ControlsState
	{
		if(cs == null)
			cs = new ControlsState();
		return cs;
	}

	public function updateState(c:Int, newState:Int):Bool
	{
		if(controls[c] != newState){
			controls[c] = newState;
			return true;
		}
		return false;
	}
}