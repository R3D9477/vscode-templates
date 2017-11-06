package;

class ExtClass {
	var gx:Int;
	public function new () gx = 0;
	public function setX (x:Int) gx = x;
	public function printX () trace('x:$gx');
}