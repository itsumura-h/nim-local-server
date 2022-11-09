import std/os
import std/strutils

proc getFiles*(path:string):seq[string] =
  ## pathのディレクトリのファイル一覧を表示します
  ## 
  ## バイナリは除外します
  runnableExamples:
    let files = getFiles("/path/to/dir")
    echo files
    # > @["subdir", "aaa.nim", "bbb.nim"]

  let currentPath = getCurrentDir() / path
  var files = newSeq[string]()
  for row in walkDir(currentPath, relative=true):
    if row.kind == pcDir or row.path.contains("."):
      files.add(row.path)
  return files
