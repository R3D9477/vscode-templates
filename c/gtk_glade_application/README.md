# vscode-templates: C

GTK+ (Glade) application

## Currently for
* Windows
  * auto detect (debug, release)
  * x86_64 (debug, release)
  * x86 (debug, release)
* Linux
  * auto detect (debug, release)
  * x86_64 (debug, release)
  * x86 (debug, release)
  * arm (debug, release)
  * arm cross-compiled (release)

## Tested with VSCode extensions
* [C/C++ for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)
* [native-debug](https://marketplace.visualstudio.com/items?itemName=webfreak.debug)

## Additional requirements
* Linux
  * [GNU C compiler](https://gcc.gnu.org/)
  * [GDB](https://www.gnu.org/software/gdb/)
  * [GNU make](https://www.gnu.org/software/make/)
  * [xmllint](http://xmlsoft.org/downloads.html)
  * [Gtk+](https://www.gtk.org/download/linux.php)
  * [Glade](https://glade.gnome.org/)
* Windows
  * [MinGW](http://www.mingw.org/wiki/HOWTO_Install_the_MinGW_GCC_Compiler_Suite) with packages:
    * mingw32-gcc-g++ (class "bin")
    * mingw32-gdb (class "bin")
    * mingw32-make (class "bin")
  * [xmllint](http://xmlsoft.org/sources/win32/)
  * [Gtk+](https://www.gtk.org/download/windows.php)
  * [Glade](http://ftp.gnome.org/pub/GNOME/binaries/win32/glade/)

## Additional notes
* C templaes are depends on [umake-c](https://github.com/r3d9u11/umake-c)
* any path (of directories "src", "include", "bin", application name  and etc) can't contain a whitespaces
* on Windows don't forget to add path of MinGW binaries (C:\MinGW\bin) to evironment variable PATH
