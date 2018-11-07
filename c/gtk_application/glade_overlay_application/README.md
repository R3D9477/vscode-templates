# vscode-templates: C

GTK+ (Glade) Overlay application (render a video)

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
  * [GDB](https://www.gnu.org/software/gdb/)
  * [GNU C compiler](https://gcc.gnu.org/)
  * [GNU make](https://www.gnu.org/software/make/)
  * [xmllint](ftp://xmlsoft.org/libxml2/)
  * [Gtk+](https://www.gtk.org/download/linux.php)
  * [GStreamer](https://gstreamer.freedesktop.org/documentation/installing/on-linux.html)
* Windows
  * [MinGW](http://www.mingw.org/wiki/HOWTO_Install_the_MinGW_GCC_Compiler_Suite) with packages:
    * mingw32-gcc-g++ (class "bin")
    * mingw32-gdb (class "bin")
    * mingw32-make (class "bin")
  * [xmllint](http://xmlsoft.org/sources/win32/)
  * [Gtk+](https://www.gtk.org/download/windows.php)
  * [GStreamer](https://gstreamer.freedesktop.org/documentation/installing/on-windows.html)

## Additional notes
* any path (of directories "src", "include", "bin", application name  and etc) can't contain a whitespaces
* on Windows don't forget to add path of MinGW binaries (C:\MinGW\bin) to evironment variable PATH
