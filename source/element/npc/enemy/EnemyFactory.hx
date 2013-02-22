package element.npc.enemy;
 
import org.flixel.FlxGroup;
import utils.Timer;
import event.GameEvent;
import event.Events;
import Std;

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

    private var timer:Timer;
    
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
        
        timer = Timer.getInstance();
    }

    private function handleTimer(gameEvent:GameEvent):Void
    {
        spamEnemy();
    }

    public function reset():Void
    {
        // setar "existes" de todo mundo pra false
        timer.addEventListener(Events.ONE_SECOND, handleTimer);
    }

    public function start():Void
    {
        timer.addEventListener(Events.ONE_SECOND, handleTimer);
    }

    public function stop():Void
    {
        timer.removeEventListener(Events.ONE_SECOND, handleTimer);
    }

    private function spamEnemy():Void
    {
        if (getFirstAvailable() != null)
        {
            //get an available bullet to fire and let haxe know its a Bullet type with cast
            var enemy = cast ( getFirstAvailable(), Enemy );
            //shoot it at the starting x and y position
            enemy.spam(Std.random(200), Std.random(200));
        }
    }
}