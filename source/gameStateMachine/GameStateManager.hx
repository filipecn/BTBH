package gameStateMachine;

import gameStateMachine.state.GameState;
import game.registry.GameStateRegistry;
import org.flixel.FlxG;
import resource.StateLoader;
import event.GameEvent;
import event.Events;

/*Global e único para todo o sistema.
Controla o fluxo do jogo, escolhe qual estado (level,cutscene,menu) é ativado ou desativado.
Exemplo: 
- O jogador escolheu uma fase no MenuDeFases. 
- O MenuDeFases avisa a GameStateManager e ela desativa o desativa. 
- A GameStateManager agora ativa a FaseEscolhida.

- O jogador aperta pause no meio da uma fase para mexer em alguma opcão.
- GameStateManager ativa o MenuDeOpcoes.
- O jogador sai do menu, GameStateManager volta para fase de onde havia parado.

Basicamente GameStateManager controlara a saida entrada de estados como uma pilha.*/

class GameStateManager
{
	private static var gsm:GameStateManager;
    
    private var gameStates:Hash<GameStateRegistry>;
    private var stateLoader:StateLoader;

    public static function new()
    {
    	if(gsm != null) throw "Error: GameStateManager singleton!";

    	gameStates = new Hash<GameStateRegistry>();
        stateLoader = StateLoader.getInstance();
    }

    public static function getInstance():GameStateManager
    {
    	if(gsm == null)
    		gsm = new GameStateManager();
    	return gsm;
    }

    public function addState(state:GameStateRegistry):Void
    {
        gameStates.set(state.name,state);
    }

    public function switchState(name:String):Void
    {
        trace("try switch - " + name);
        if(gameStates.exists(name)){
            trace("switch to " + name);    
            FlxG.switchState( mountState(name) );
        }
        else {
            trace("switch state failed!");
            stateLoader.addEventListener(Events.STATE_LOADED, handleStateLoaded);
            trace("loading!");
            FlxG.switchState( mountState('loading') );
            trace("load state " + name);
            stateLoader.loadState(name);
        }
    }

    private function mountState(name:String):Dynamic
    {
        var newStateRegistry = gameStates.get(name);
        var newState = Type.createInstance(Type.resolveClass('gameStateMachine.state.'+Reflect.field(newStateRegistry, "type")+'State'),[]);
        Reflect.callMethod(newState, Reflect.field(newState,"setRegistry"), [newStateRegistry]);
        return newState;
    }

    private function handleStateLoaded(gameEvent:GameEvent):Void
    {
        FlxG.switchState( mountState(cast(gameEvent.userData, String)) );
        stateLoader.removeEventListener(Events.STATE_LOADED, handleStateLoaded);
    }

    public function completeLevel():Void
    {
    	
    }
 	
 	public function stackLevel():Void
 	{
 		
 	}   
}