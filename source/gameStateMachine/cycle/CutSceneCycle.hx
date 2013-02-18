package gameStateMachine.cycle;

import gameStateMachine.state.PlayState;
import io.InputManager;
import event.Events;
import event.GameEvent;

class CutSceneCycle extends GameCycle
{
	public var skippable:Bool;

	public function new():Void
	{
		super();
	}

	private function handleMouseJustReleased(gameEvent:GameEvent):Void
	{
		if(!skippable) return;
		playState.completeCycle();
	}

	override public function activate():Void
	{
		im.addEventListener(Events.MOUSE_JUST_RELEASED, handleMouseJustReleased);		
	}

	override public function deactivate():Void
	{
		im.removeEventListener(Events.MOUSE_JUST_RELEASED, handleMouseJustReleased);
	}
}