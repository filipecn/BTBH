package gameStateMachine.cycle;

import element.npc.enemy.EnemyFactory;
import levelObjective.Objective;
import io.InputManager;
import io.ControlsState;
import event.Events;
import event.GameEvent;
import game.Registry;

/*Representa um ciclo do conjunto que compoe o Level.

- Um ciclo é composto por objetivos e inimigos. O ciclo 
é finalizado quando todos objetivos obrigatórios são completados.*/
class LevelCycle extends GameCycle
{
	public var enemyFactories:Array<EnemyFactory>;

	public var objectives:Array<Objective>;

	private var cs:ControlsState;

	private var reg:Registry;

	public function new():Void
	{
		super();
		enemyFactories = new Array<EnemyFactory>();
		objectives = new Array<Objective>();
		cs = ControlsState.getInstance();
		reg = Registry.getInstance();
	}

	override public function update():Void
	{
		super.update(); // atualiza os controles

		for (i in 0...Definitions.KEY_CONTROLS_NUMBER) 
		{
			if (cs.controls[i] == Definitions.JUST_PRESSED) {
				switch (i) {
					case Definitions.UP:
						reg.player.moveUp();
					case Definitions.DOWN:
						reg.player.moveDown();
					case Definitions.LEFT:
						reg.player.moveLeft();
					case Definitions.RIGHT:
						reg.player.moveRight();
					case Definitions.FIRE:
						//PEW PEW PEW
					case Definitions.START:
						//pause
					case Definitions.WEAPON:
						//muda arma
				}
			}
		}
	}

	private function handleMouseJustReleased(gameEvent:GameEvent):Void
	{
		playState.completeCycle();
	}

	override public function activate():Void
	{
		im.addEventListener(Events.MOUSE_JUST_RELEASED, handleMouseJustReleased);
		for (ef in enemyFactories)
			ef.reset();
	}

	override public function deactivate():Void
	{
		im.removeEventListener(Events.MOUSE_JUST_RELEASED, handleMouseJustReleased);
		for (ef in enemyFactories)
			ef.stop();
	}
}