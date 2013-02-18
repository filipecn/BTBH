package element.npc.enemy;

/*Classe base com os atributos inerentes a todos inimigos */ 
class Enemy extends Object
{
	public var life:Int;
	public var damage:Int;
	public var speed:Int; 

	public function new(){
		super(); 	
	}
}