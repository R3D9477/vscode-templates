import ospaths

mode = ScriptMode.Verbose

version = "1.0"
author = "Username"
description = "Build with debug configuration"
license = "MIT"

srcDir = "src"
binDir = "bin/debug"
let qmlDir = "qmlui"

mkdir(binDir)

proc buildResources (dir: string) =
  for subdir in listDirs(dir):
    buildResources(subdir)
  for subfile in listFiles(dir):
    var (dir, name, ext) = splitFile(subfile)
    if ext == ".qrc":
      exec ("rcc --binary " & subfile & " -o " & joinPath(binDir, name & ".rcc"))

buildResources(qmlDir)

let buildAppCmd = "nim" &
  " " & "cc" &
  " " & "--nimcache:" & joinPath(@[binDir, "nimcache"]) &
  " " & "--out:" & joinPath(@[binDir, "main"]) &
  " " & "-d:debug" &
  " " & "--debuginfo" &
  " " & "--lineDir:on" &
  " " & "--debugger:native" &
  " " & joinPath(@[srcDir, "main.nim"])

exec buildAppCmd