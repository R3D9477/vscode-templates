import ospaths

mode = ScriptMode.Verbose

version = "1.0"
author = "Username"
description = "Build with release configuration"
license = "MIT"

srcDir = "src"
binDir = "bin/debug"

mkdir(binDir)

let buildAppCmd = "nim" &
  " " & "cc" &
  " " & "--nimcache:" & joinPath(@[binDir, "nimcache"]) &
  " " & "--out:" & joinPath(@[binDir, "main"]) &
  " " & "-d:release" &
  " " & joinPath(@[srcDir, "main.nim"])

exec buildAppCmd