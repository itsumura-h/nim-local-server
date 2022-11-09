# Package

version       = "0.1.0"
author        = "Anonymous"
description   = "A new awesome nimble package"
license       = "MIT"
srcDir        = "src"
bin           = @["localserver"]


# Dependencies

requires "nim >= 1.6.8"
requires "cligen"

task docs, "generate html documents":
  let cmd = "nim doc --project --index:on --outdir:docs src/localserver.nim"
  exec(cmd)
