package;

class Main {
	public static function main () {
		#if debug
			new debugger.HaxeRemote(true, "localhost");
		#end
		
		Sys.print("Press any key to exit...");
		Sys.stdin().readByte();
	}
}