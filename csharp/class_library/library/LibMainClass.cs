using System;

namespace library
{
	public class LibMainClass
	{
		int gx;
		
		public LibMainClass () { gx = 0; }
		public void setX (int x) { gx = x; }
		public void printX () { Console.WriteLine("x:{0}", gx); }
	}
}