package game;

import nme.Lib;
import nme.Assets;
import org.flixel.FlxG;
import org.flixel.FlxSprite;

/*Representa o player do jogo, todos atributos e etc.*/ 
class Player
{
	public var sprite:FlxSprite;

	public var speed:Int; 
	public var health:Int;
	public var x:Int;
	public var y:Int;

	public function new():Void{
		x =  30;
		y = 215;
	}

	public function getSprite():FlxSprite
	{
		sprite = new FlxSprite(x, y,"assets/gfx/player.png");
		return sprite;
	}

	public function moveUp():Void{
		sprite.y += speed;
		if (sprite.y>430) {
			sprite.y = 430;
		}
	}

	public function moveDown():Void{
		sprite.y -= speed;
		if (sprite.y<0) {
			sprite.y = 0;
		}
	}

	public function moveRight():Void{
		sprite.x += speed;
		if (sprite.x>590) {
			sprite.x =  590;
		}
	}

	public function moveLeft():Void{
		sprite.x -= speed;
		if (sprite.x<0) {
			sprite.x =  0;
		}
	}
}