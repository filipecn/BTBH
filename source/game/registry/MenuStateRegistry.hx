package game.registry;

import element.menu.Button;

class MenuStateRegistry extends GameStateRegistry
{
    public var buttons:Array<Button>;

    public function new():Void
    {
    	super();
        buttons = new Array<Button>();
    }
}