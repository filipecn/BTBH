package gameStateMachine.cycle;

import element.npc.enemy.EnemyFactory;
import levelObjective.Objective;
import io.InputManager;
import event.Events;
import event.GameEvent;

/*Representa um ciclo do conjunto que compoe o Level.

- Um ciclo é composto por objetivos e inimigos. O ciclo 
é finalizado quando todos objetivos obrigatórios são completados.*/
class LevelCycle extends GameCycle
{
	public var enemyFactories:Array<EnemyFactory>;

	public var objectives:Array<Objective>;

	public function new():Void
	{
		super();
		enemyFactories = new Array<EnemyFactory>();
		objectives = new Array<Objective>();
	}

	private function handleMouseJustReleased(gameEvent:GameEvent):Void
	{
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