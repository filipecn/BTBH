package resource;

import Std;
import haxe.xml.Fast;
import gameStateMachine.cycle.GameCycle;
import gameStateMachine.cycle.CutSceneCycle;
import gameStateMachine.cycle.LevelCycle;
import gameStateMachine.state.PlayState;
import element.menu.Button;

class ElementLoader
{
	public static function loadButton(button:haxe.xml.Fast):Button
	{
		var x:Int = 0;
		//X
		if(button.hasNode.x)
			x = Std.parseInt(button.node.x.innerData);
		var y:Int = 0;
		//Y
		if(button.hasNode.y)
			y = Std.parseInt(button.node.y.innerData);
		var action:String = "";
		//ACTION
		if(button.hasNode.action)
			action = button.node.action.innerData;

		var b:Button = new Button(x, y, action);
		return b;
	}
}