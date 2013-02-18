package element.menu;

import org.flixel.FlxButton;
import gameStateMachine.GameStateManager;

class Button
{
	public var x:Int;
	public var y:Int;
	public var action:String;

	private var gsm:GameStateManager;

	public var button:FlxButton;

	public function new(_x:Int, _y:Int, _action:String):Void
	{
		x = _x;
		y = _y;
		action = _action;
		trace("ACTION " +  action);

		gsm = GameStateManager.getInstance();
	}

	public function init():Void
	{
		button = new FlxButton(x, y, "label", onClick);
	}

	private function onClick():Void
	{
		gsm.switchState(action);
	}
}