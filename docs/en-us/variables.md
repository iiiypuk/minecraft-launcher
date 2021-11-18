# Variables
## MC_DIR
!> Minecraft directory

The variable `MC_DIR` is the key variable on the basis of which the paths in the script are built.

When using a non-standard path, you should change the directory at your discretion.

You can specify a relative path if the script file is located in the directory with the game, for example:
* for Windows `%CD%`
* for Linux `./`

?> However, it should be noted that on Windows, if the script file is located in a different directory and on a different local disk,
first you need to go to the disk where the game is located (by default `%SystemDrive%`).
Otherwise, the settings files and save directories will appear next to the script.

## GAME_DIR
!> Directory with game settings

User files are stored in this directory:
* `saves` - saves directory
* `resourcepacks` - resource packs directory
* `screenshots` - shapshots directory
* `options.txt` - options file

?> It is recommended to keep them in a separate directory to avoid confusion and easily transfer your files to other computers.

?> By default using `MC_DIR`

## ASSETS_DIR
!> Minecraft assets directory

## ASSETS_INDEX
!> Minecraft assets index

Stored in `version['assetIndex']['id']`.
Has the same meaning as the version of the game, excluding the [patch](https://semver.org/lang/ru/#spec-item-2).

Example `1.16` for game versions `1.16.3`, `1.16.4`, `1.16.5`.

## GAME_VERSION
!> Minecraft version

## NATIVES_DIR
!> Directory with binary libraries

## LIBRARIES_LIST
!> Dependency library path list

The `Release` version of the launcher is present.
In other cases, you need to generate it yourself.

## PLAYER_NAME
!> Player name

By default, when the script starts, the user is prompted to enter the player's name interactively.

If there is no need to change the name when starting the script, write down the required name in the variable.
``` batch
set PLAYER_NAME=Steve
```
and remove this line
``` batch
set /p player=What username would you like?
```

## WINDOW_W
!> Game window width

## WINDOW_H
!> Game window height

## JVM_RAM
!> Java virtual machine variable that determines the size of the consumed RAM

## JVM_ARGS
!> Java virtual machine variable that defines its variables
