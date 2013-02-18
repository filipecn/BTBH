package game;

import gameStateMachine.GameStateManager;
import resource.PlayerLoader;
import resource.StateLoader;
import org.flixel.FlxGroup;
import haxe.FastList;

/*Global a todo sistema. Guarda objetos unicos para o jogo inteiro, como Player e Preferences. 
Provavelmente será o lugar onde carregaremos xmls que definem as fases, inimigos jogadores...*/
class Registry
{
	private static var instance:Registry;
    public var player:Player;
    public var preferences:Preferences;

    public static function new():Void
    {
    	if(instance != null) 
    		throw "Error: registry singleton!";
 		
    	preferences = new Preferences();
    }

    public static function getInstance():Registry
    {
    	if(instance == null)
    		instance = new Registry();
    	return instance;
    }

    public function init():Void
    {
        player = PlayerLoader.loadPlayer("Riggs");
        StateLoader.getInstance().loadStates("gameStates");
    }
}