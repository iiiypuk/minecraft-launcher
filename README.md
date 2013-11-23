Minecraft Batch Launcher
========================

### Русская справка ###
Скрипт для запуска Minecraft без официального лаунчера.  
Собирается **Quick Batch File Compiler** для создание exe'шника.

При первом запуске создается файл `nickname.txt` в папке профиля (`%GAME_DIR%`).

**Описание переменных**

+ `%MC_DIR%` - директория с файлами Minecraft. По умолчанию `%appdata%\.minecraft`
+ `%NATIVES_DIR%` - директория с библиотеками для запуск игры.  
Можно взять [отсюда](https://github.com/IIIypuk/minecraft-launcher/tree/master/natives).
+ `%GAME_DIR%` - директория с файлами пользователя. Ресурс-паки, сохранения, скриншоты и др.
+ `%ASSETS_DIR%` - директория с библиотеками. Лежит в корне папки Minecraft (`%MC_DIR%\assets`).
+ `%VERSION%` - номер версии Minecraft (`%MC_DIR%\versions\%VERSION%`).
