package event;

import nme.events.Event;

class GameEvent extends Event
{
	public var userData:Dynamic;

	public function new(_type:String, ?_userData:Dynamic=null):Void
	{
		super(_type);
		userData = _userData;
	}
}