package game.registry;

import io.InputManager;
import gameStateMachine.cycle.GameCycle;

class PlayStateRegistry extends GameStateRegistry
{
	public var gameCycles:Array<GameCycle>;
	public var cyclesSequence:Array<Int>;

	public function new():Void
	{
		super();
		gameCycles = new Array<GameCycle>();
		cyclesSequence = new Array<Int>();
	}
}