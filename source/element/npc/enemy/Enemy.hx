package element.npc.enemy;

import org.flixel.FlxSprite;

/*Classe base com os atributos inerentes a todos inimigos */ 
class Enemy extends FlxSprite
{
	public var life:Int;
	public var damage:Int;
	public var speed:Int; 

	public function new(x:Int, y:Int, image:String){
		super(x,y,image); 	

		exists = false;
	}

	public function spam(_x:Int, _y:Int):Void
	{
		exists = true;
		x = _x;
		y = _y;
	}
}