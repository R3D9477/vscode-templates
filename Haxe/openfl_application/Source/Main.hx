import openfl.display.*;

class Main extends Sprite {
	public function new () {
		super();
		
		var img:Shape;
		
		// draw circle
		
		img = new Shape();
		
		img.graphics.beginFill(0x00FF00);
		img.graphics.drawCircle(0, 0, 20);
		img.graphics.endFill();
		
		img.x = 25;
		img.y = 25;
		
		this.addChild(img);
	}
}
