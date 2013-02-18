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
import org.flixel.plugin.photonstorm.FlxDisplay;
import game.registry.MenuStateRegistry;
import element.menu.Button;

class MenuState extends GameState
{
    public var msr:MenuStateRegistry;

    public function new():Void
    {
        super();
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
        var controls:FlxText = new FlxText(0, 0, 360, "MAIN MENU (mouse click to continue)");
        add(controls);

        for (i in 0...msr.buttons.length){
            msr.buttons[i].init();
            add(msr.buttons[i].button);
            //FlxDisplay.screenCenter(msr.buttons[i].button,true,true);
        }
    }

    override public function destroy():Void
    {
        super.destroy();
    }

    override public function update():Void
    {
        super.update();
    }   

    override public function setRegistry(r:Dynamic):Void
    {
        msr = cast (r, MenuStateRegistry);
    }
}