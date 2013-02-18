package;

import gameStateMachine.state.GameState;
import gameStateMachine.state.MenuState;
import gameStateMachine.state.PlayState;


class DCEHandler
{
	static public function handle():Void
	{
		var gs:GameState = new GameState();
		var ms:MenuState = new MenuState();
		var ps:PlayState = new PlayState();
	}
}