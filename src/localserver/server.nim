import std/asyncdispatch
import std/asynchttpserver
import std/asyncfile
import std/httpcore
import std/os
import std/mimetypes
import std/strutils
import ./file
import ./view

proc main*(port:int) {.async.} =
  var server = newAsyncHttpServer()
  proc cb(req: Request) {.async.} =
    # echo (req.reqMethod, req.url, req.headers)

    if req.url.path.contains("."):
      let filePath = getCurrentDir() / req.url.path
      if fileExists(filepath):
        # URLから拡張子を取り出し、拡張子からContentTypeを取りだす
        let ext = req.url.path.split(".")[^1]
        let contentType = newMimetypes().getMimetype(ext)
        # ファイルの中身を読み込む
        let file = openAsync(filepath, fmRead)
        defer: file.close()
        let data = file.readAll().await
        # レスポンスヘッダーにContent-Typeをセットする
        let headers = newHttpHeaders()
        headers["Content-Type"] = contentType
        # レスポンスを返す
        await req.respond(Http200, data, headers)
    else:
      let files = getFiles(req.url.path)
      let body = displayView(req.url.path, files)
      let headers = newHttpHeaders()
      headers["Content-Type"] = "text/html"
      await req.respond(Http200, body, headers)

    await req.respond(Http404, "")

  server.listen(Port(port))
  let port = server.getPort
  echo "test this with: curl localhost:" & $port.uint16 & "/"
  while true:
    if server.shouldAcceptRequest():
      await server.acceptRequest(cb)
    else:
      await sleepAsync(500)
