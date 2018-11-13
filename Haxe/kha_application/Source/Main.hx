package;

import kha.System;

class Main {
	public static function main() {
		#if debug
			#if cpp
				new debugger.HaxeRemote(true, "localhost");
			#end
		#end
		
		System.init({title: "Project", width: 1024, height: 768}, function () {
			new Project();
		});
	}
}