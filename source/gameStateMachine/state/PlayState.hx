package gameStateMachine.state;

import nme.Assets;
import nme.geom.Rectangle;
import nme.net.SharedObject;
import org.flixel.FlxButton;
import org.flixel.FlxG;
import org.flixel.FlxPath;
import org.flixel.FlxSave;
import org.flixel.FlxSprite;
import org.flixel.FlxState;
import org.flixel.FlxText;
import org.flixel.FlxU;
import org.flixel.FlxGroup;
import io.InputManager;
import gameStateMachine.cycle.GameCycle;
import gameStateMachine.GameStateManager;
import game.registry.PlayStateRegistry;

/*PlayState é composto por gameCycles, ou seja, vários ciclos. Quando um ciclo termina, ele 
deve decidir qual será o próximo.*/
class PlayState extends GameState
{
	public var psr:PlayStateRegistry;
	public var enemyPool:FlxGroup;

	private var currStep:Int = 0;
	private var txt:FlxText;

	public function new():Void
	{
		super();

		gsm = GameStateManager.getInstance();
		enemyPool = new FlxGroup();
	}

	override public function create():Void
	{
		#if !neko
		FlxG.bgColor = 0xff131c1b;
		#else
		FlxG.camera.bgColor = {rgb: 0x131c1b, a: 0xff};
		#end		
		FlxG.mouse.show();

		/*TEXT*/
		txt = new FlxText(0, 0, 360, "PLAY STATE " + psr.name + "(mouse click to continue) CYCLE=0");

        add(txt);

        currStep = 0;
        psr.gameCycles[psr.cyclesSequence[currStep]].activate();
	}
	
	override public function destroy():Void
	{
		super.destroy();
	}

	override public function update():Void
	{
		super.update();

		psr.gameCycles[psr.cyclesSequence[currStep]].update();
	}	

	public function completeCycle():Void
	{
		psr.gameCycles[psr.cyclesSequence[currStep]].deactivate();
		currStep++;
		txt.text = "PLAY STATE " + psr.name + "(mouse click to continue) CYCLE=" + currStep;
		if(currStep >= psr.cyclesSequence.length)
			gsm.switchState(psr.nextState);
		else
			psr.gameCycles[psr.cyclesSequence[currStep]].activate();
	}

    override public function setRegistry(r:Dynamic):Void
    {
        psr = cast (r, PlayStateRegistry);

        for (i in 0...psr.gameCycles.length) {
        	psr.gameCycles[i].playState = this;
        }
    }
}