# vscode-templates: C

shared library with test

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
* [GDB](https://www.gnu.org/software/gdb/)
* Linux
  * [GNU C compiler](https://gcc.gnu.org/)
  * [GNU make](https://www.gnu.org/software/make/)
* Windows
  * [MinGW](http://www.mingw.org/wiki/HOWTO_Install_the_MinGW_GCC_Compiler_Suite) with packages:
    * mingw32-gcc-g++ (class "bin")
    * mingw32-gdb (class "bin")
    * mingw32-make (class "bin")

## Additional notes
* C templaes are depends on [umake-c](https://github.com/r3d9u11/umake-c)
* any path (of directories "src", "include", "bin", application name  and etc) can't contain a whitespaces
* on Windows don't forget to add path of MinGW binaries (C:\MinGW\bin) to evironment variable PATH
