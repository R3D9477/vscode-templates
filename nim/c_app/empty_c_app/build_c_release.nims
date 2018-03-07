import ospaths

mode = ScriptMode.Verbose

version = "1.0"
author = "Username"
description = "Build with release configuration"
license = "MIT"

let outDir = "bin/release"

mkdir(outDir)

let buildAppCmd = "nim" &
  " " & "cc" &
  " " & "--nimcache:" & joinPath(@[outDir, "nimcache"]) &
  " " & "--out:" & joinPath(@[outDir, "main"]) &
  " " & "-d:release" &
  " " & "src/main.nim"

exec buildAppCmd