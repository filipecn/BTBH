package element.npc.enemy;
 
import org.flixel.FlxGroup;

/*A flixel permite agrupar FlxObjects (sprintes, texts, ...). Além disso, temos
o FlxU.Collide! Assim, podemos fazer a colisao entre objetos do mesmo grupo,
grupos diferentes, objetos contra grupos inteiros... tudo automatico!*/ 
 
class EnemyFactory extends FlxGroup
{
    public var minWaveSize:Int;
    public var maxWaveSize:Int;
    public var maxCount:Int;
    public var minDelay:Int;
    public var maxDelay:Int;
    public var minLife:Int;
    public var maxLife:Int;
    public var minDamage:Int;
    public var maxDamage:Int;
    public var minSpeed:Int;
    public var maxSpeed:Int;

    public function new(type:String, poolSize:Int = 10)
    {
        super();
        
        var toe:TypeOneEnemy = new TypeOneEnemy();
        
        var i = 0;
        while (i < poolSize) {
            var enemy = Type.createInstance(Type.resolveClass('element.npc.enemy.'+type+'Enemy'),[]);
            add(enemy);
            i++;
        }
 
    }
}