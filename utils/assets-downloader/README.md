# 🇺🇸 Assets downloader

> ⚠️ write it...

# 🇷🇺 Загрузчик ассетов

Утилита, которая встраивается в основной скрипт и скачивает ассеты из сети.

Используется программа на **Си** для парсинга файла индексов ассетов.

## About assets

The game itself downloads (through the launcher) further resources from

```text
https://resources.download.minecraft.net/
```

> ⚠️ http://resources.download.minecraft.net/ no longer works - you must use https

The asset index for each version is linked in the `<version>.json`. An example url to the asset index could look like this

```text
https://launchermeta.mojang.com/mc/assets/1.12/67e29e024e664064c1f04c728604f83c24cbc218/1.12.json
```

Each resource in the file has a name (the field name of the resource object), a SHA1 hash, and a file size. The client currently downloads all resources in the index from

```text
https://resources.download.minecraft.net/<first 2 hex letters of hash>/<whole hash>
```

and stores them in

```text
.minecraft/assets/objects/<first 2 hex letters of hash>/<whole hash>
```

and a copy is stored in

```text
.minecraft/assets/virtual/legacy/ 
```

in the old format for versions that don't support the new system (1.7 and below)

ℹ️ From: https://wiki.vg/Game_files#Assets
