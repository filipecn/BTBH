package resource;

import Std;
import haxe.xml.Fast;
import game.Player;

class PlayerLoader
{
	static public function loadPlayer(name:String):Player{
		
		var p:Player = new Player();

		var xmlData:Xml = Xml.parse(ApplicationMain.getAsset("assets/player.xml"));

		var fast = new haxe.xml.Fast(xmlData.firstElement());
		
		for(player in fast.nodes.player){
			if(player.att.name == name){
				if(player.hasNode.speed)
					p.speed = Std.parseInt(player.node.speed.innerData);
				if(player.hasNode.health)
					p.health = Std.parseInt(player.node.health.innerData);
				break;
			}
		}
		
		return p;
	}
}