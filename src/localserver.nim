## # local server
## 現在のディレクトリのファイルを返すサーバーです。
## ```sh
## localserver -p:8080
## > start server on http://localhost:8080
## ```

import asyncdispatch
import tables
import ./localserver/server

proc localserver(port=8080) =
  ## ローカルでサーバーを起動するコマンドです
  waitFor main(port)

const HELP = {"port": "ここに指定したportでサーバーが起動します"}.toTable()

when isMainModule:
  import cligen
  dispatch(localserver, help=HELP)
