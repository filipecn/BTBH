package gameStateMachine.cycle;

import element.npc.enemy.EnemyFactory;
import levelObjective.Objective;
import io.InputManager;
import event.Events;
import gameStateMachine.state.PlayState;

class GameCycle
{
	public var id:Int;
	
	public var playState:PlayState;	

	private var im:InputManager;

	private var stopped:Bool;

	public function new():Void
	{
		im = InputManager.getInstance();

		stopped = false;
	}

	public function update():Void
	{
		im.keyboardUpdate();
		im.mouseUpdate();
	}

	public function activate():Void
	{

	}

	public function deactivate():Void
	{
		
	}
}