package utils;

import haxe.Timer;
import nme.events.EventDispatcher;
import event.GameEvent;
import event.Events;

class Timer extends EventDispatcher
{
	private static var instance:Timer;

	private var timer:haxe.Timer;

	public static function new():Void
	{
		if(instance != null) throw "Error: timers is a singleton!";
		super();
		timer = new haxe.Timer(1000);
		timer.run = run;
	}

	private function run():Void
	{
		dispatchEvent(new GameEvent(Events.ONE_SECOND));
	}

	public static function getInstance():Timer
	{
		if(instance == null)
			instance = new Timer();
		return instance;
	}
}