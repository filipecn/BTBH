package resource;

import Std;
import haxe.xml.Fast;
import game.registry.GameStateRegistry;
import game.registry.MenuStateRegistry;
import game.registry.PlayStateRegistry;
import gameStateMachine.GameStateManager;
import nme.events.EventDispatcher;
import event.GameEvent;
import event.Events;

class StateLoader extends EventDispatcher
{
	private static var sl:StateLoader;

	public function new():Void
	{
		if(sl != null) throw "Error: StateLoader is a singleton!";
		super();
	}

	public static function getInstance():StateLoader
	{
		if(sl == null)
			sl = new StateLoader();
		return sl;
	}

	public function loadStates(name:String):Void
	{
		var xmlData:Xml = Xml.parse(ApplicationMain.getAsset("assets/"+name+".xml"));	
		var fast = new haxe.xml.Fast(xmlData.firstElement());
		var gsm:GameStateManager = GameStateManager.getInstance();

		for(gameState in fast.nodes.gameState){
			switch(gameState.att.type){
				case "Play": gsm.addState(readPlayState(gameState));
				case "Menu": gsm.addState(readMenuState(gameState)); 
			}
		}

		dispatchEvent(new GameEvent(Events.STATES_LOADED, name));
	}

	public function loadState(name:String):Void
	{
		trace("LOADSTATE: " + "assets/"+name+".xml");
		var xmlData:Xml = Xml.parse(ApplicationMain.getAsset("assets/"+name+".xml"));
		var fast = new haxe.xml.Fast(xmlData.firstElement());
		var gsm:GameStateManager = GameStateManager.getInstance();

		switch(fast.att.type){
				case "Play": gsm.addState(readPlayState(fast));
				case "Menu": gsm.addState(readMenuState(fast)); 
			}

		dispatchEvent(new GameEvent(Events.STATE_LOADED, name));
	}

	static public function readPlayState(gameState:haxe.xml.Fast):PlayStateRegistry
	{
		var psr:PlayStateRegistry = new PlayStateRegistry();
		trace(gameState.att.type + " " + gameState.att.name);
		if(gameState.has.nextState)
			psr.nextState = gameState.att.nextState;
		if(gameState.has.name)
			psr.name = gameState.att.name;
		if(gameState.has.type)
			psr.type = gameState.att.type;
		for(gameCycle in gameState.node.gameCycles.nodes.gameCycle){
			switch(gameCycle.att.type){
				case 'CutScene': psr.gameCycles.push(CycleLoader.loadCutSceneCycle(gameCycle));
				case 'Level': psr.gameCycles.push(CycleLoader.loadLevelCycle(gameCycle));
			}
		}

		if(gameState.hasNode.sequence){
			var r = ~/([0-9]+)/;
			var str:String = gameState.node.sequence.innerData;
			while (r.match(str)) {
  				psr.cyclesSequence.push(Std.parseInt(r.matched(1)));
  				str = r.matchedRight();
			} 
		}

		return psr;
	}
	
	static public function readMenuState(gameState:haxe.xml.Fast):MenuStateRegistry
	{
		var msr:MenuStateRegistry = new MenuStateRegistry();

		trace(gameState.att.type + " " + gameState.att.name);
		if(gameState.has.name)
			msr.name = gameState.att.name;
		if(gameState.has.type)
			msr.type = gameState.att.type;

		for(button in gameState.node.buttons.nodes.button){
			msr.buttons.push(ElementLoader.loadButton(button));
		}

		return msr;
	}
}