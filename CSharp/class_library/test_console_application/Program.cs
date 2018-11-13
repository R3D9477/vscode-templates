using System;

namespace test_console_application
{
	class Program
	{
		static void Main(string[] args)
		{
			var lmc = new library.LibMainClass();
			lmc.setX(123);
			lmc.printX();

			Console.Write("\nPress any key to continue...");
			Console.ReadKey(true);
		}
	}
}