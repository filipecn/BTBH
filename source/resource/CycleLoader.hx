package resource;

import Std;
import haxe.xml.Fast;
import gameStateMachine.cycle.GameCycle;
import gameStateMachine.cycle.CutSceneCycle;
import gameStateMachine.cycle.LevelCycle;
import gameStateMachine.state.PlayState;
import element.npc.enemy.EnemyFactory;

class CycleLoader
{
	public static function loadCutSceneCycle(gameCycle:haxe.xml.Fast):CutSceneCycle
	{
		var csc:CutSceneCycle = new CutSceneCycle();
		//SKIPPABLE
		try{
			if(gameCycle.node.skippable.innerData == 'true')
				csc.skippable = true;
			else csc.skippable = false;
		} catch (unknown : Dynamic)
			csc.skippable = true;
		return csc;
	}

	public static function loadLevelCycle(gameCycle:haxe.xml.Fast):LevelCycle
	{
		var lc:LevelCycle = new LevelCycle();
		
		if(gameCycle.hasNode.enemyFactories){
			for(enemyFactory in gameCycle.node.enemyFactories.nodes.enemyFactory){
				lc.enemyFactories.push(loadEnemyFactory(enemyFactory));
			}
		}
		return lc;
	}

	public static function loadEnemyFactory(enemyFactory:haxe.xml.Fast):EnemyFactory
	{
		var ef:EnemyFactory;

		if(enemyFactory.hasNode.poolSize)
			ef = new EnemyFactory(enemyFactory.att.type, 
					Std.parseInt(enemyFactory.node.poolSize.innerData));
		else ef = new EnemyFactory(enemyFactory.att.type);
					
		if(enemyFactory.hasNode.maxCount)
			ef.maxCount = Std.parseInt(enemyFactory.node.maxCount.innerData);

		var r = ~/([0-9]+)-([0-9]+)/;
		//WAVE SIZE
		try{
			r.match(enemyFactory.node.waveSize.innerData);
			ef.minWaveSize = Std.parseInt(r.matched(1));
			ef.maxWaveSize = Std.parseInt(r.matched(2));
		} catch (unknown : Dynamic)
			ef.maxWaveSize = ef.minWaveSize = 
			Std.parseInt(enemyFactory.node.waveSize.innerData);
		//DELAY
		try{
			r.match(enemyFactory.node.delay.innerData);
			ef.minDelay = Std.parseInt(r.matched(1));
			ef.maxDelay = Std.parseInt(r.matched(2));
		} catch (unknown : Dynamic)
			ef.maxDelay = ef.minDelay = 
			Std.parseInt(enemyFactory.node.delay.innerData);
		//LIFE
		try{
			r.match(enemyFactory.node.life.innerData);
			ef.minLife = Std.parseInt(r.matched(1));
			ef.maxLife = Std.parseInt(r.matched(2));
		} catch (unknown : Dynamic)
			ef.maxLife = ef.minLife = 
			Std.parseInt(enemyFactory.node.life.innerData);
		//DAMAGE
		try{
			r.match(enemyFactory.node.damage.innerData);
			ef.minDamage = Std.parseInt(r.matched(1));
			ef.maxDamage = Std.parseInt(r.matched(2));
		} catch (unknown : Dynamic)
			ef.maxDamage = ef.minDamage =
			Std.parseInt(enemyFactory.node.damage.innerData);
		//SPEED
		try{
			r.match(enemyFactory.node.speed.innerData);
			ef.minSpeed = Std.parseInt(r.matched(1));
			ef.maxSpeed = Std.parseInt(r.matched(2));
		} catch (unknown : Dynamic)
			ef.maxSpeed = ef.minSpeed = 
			Std.parseInt(enemyFactory.node.speed.innerData);
		return ef;
	}
}