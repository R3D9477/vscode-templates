# vscode-templates: C

## shared library with test

Currently for
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

Tested with VSCode extensions
* [C/C++ for Visual Studio Code](https://marketplace.visualstudio.com/items?itemName=ms-vscode.cpptools)

Additional requirements
* Linux
  * [GNU C compiler](https://gcc.gnu.org/)
  * [GNU make](https://www.gnu.org/software/make/)
* Windows
  * [MinGW](http://www.mingw.org/wiki/HOWTO_Install_the_MinGW_GCC_Compiler_Suite)