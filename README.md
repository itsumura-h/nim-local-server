https://speakerdeck.com/dumblepy/nimdejing-de-huairusabawozuo-ru-2b58aad5-2003-4baa-aef9-674c2c064de3

## 環境構築
### Windowsの人
https://github.com/dom96/choosenim/releases/download/v0.8.4/choosenim-0.8.4_windows_amd64.exe  
ここからWindows用のインストーラーをダウンロード  
ダウンロードしたexeをWindows Power Shellやコマンドプロンプトから実行する
```
dir
> choosenim-0.8.4_windows_amd64.exe

choosenim-0.8.4_windows_amd64.exe stable --firstInstall -y
```

ウィンドウを一度閉じて再度開く
```sh
nim -v

>Nim Compiler Version 1.6.8 [Windows: amd64]
Compiled at 2022-09-27
Copyright (c) 2006-2021 by Andreas Rumpf

active boot switches: -d:release
```

### Intel Macの人
```
curl https://nim-lang.org/choosenim/init.sh -sSf | sh
```

### M1 Macの人
```sh
brew insall nim
```

### Linuxの人
```
curl https://nim-lang.org/choosenim/init.sh -sSf | sh
```

### それでもダメだった人
Dockerを使いましょう

```sh
docker build ./docker/app -t localserver
docker run -it --rm -v `pwd`:/application -w /application localserver bash
```
