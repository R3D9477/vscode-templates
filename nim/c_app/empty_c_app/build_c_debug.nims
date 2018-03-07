import ospaths

mode = ScriptMode.Verbose

version = "1.0"
author = "Username"
description = "Build with debug configuration"
license = "MIT"

let outDir = "bin/debug"

mkdir(outDir)

let buildAppCmd = "nim" &
  " " & "cc" &
  " " & "--nimcache:" & joinPath(@[outDir, "nimcache"]) &
  " " & "--out:" & joinPath(@[outDir, "main"]) &
  " " & "-d:debug" &
  " " & "--debuginfo" &
  " " & "--lineDir:on" &
  " " & "--debugger:native" &
  " " & "src/main.nim"

exec buildAppCmd