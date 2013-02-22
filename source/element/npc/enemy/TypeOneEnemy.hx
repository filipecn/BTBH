package element.npc.enemy;

import Std;

/*Classe base com os atributos inerentes a todos inimigos */ 
class TypeOneEnemy extends Enemy
{
	 public function new(){
	 	super(0, 0,"assets/gfx/bullet.png");
	 }

	 override public function spam(_x:Int, _y:Int):Void
	 {
	 	exists = true;
	 	x = _x;
	 	y = _y;
	 }

	 override public function update():Void
	 {
	 	x += ((Std.random(100)>49)?-1:1)*Std.random(3);
	 	y += ((Std.random(100)>49)?-1:1)*Std.random(3);
	 }
}