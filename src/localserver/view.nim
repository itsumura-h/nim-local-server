#? stdtmpl | standard
#proc displayView*(path:string, files:seq[string]): string =
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Current Directory Files</title>
</head>
<body>
  # let urlPath = if path == "/": "" else: path
  <h1>Directory listing for ${path}</h1>
  <hr>
  #if files.len > 0:
    <ul>
      #for file in files:
        <li><a href="${urlPath}/${file}">${file}</a></li>
      #end for
    </ul>
  #end if
  <hr>
</body>
</html>
