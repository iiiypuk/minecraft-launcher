Minecraft Batch Launcher
========================

### English help ###
## 1. Installation ##
Get to the [launcher page](https://github.com/IIIypuk/minecraft-launcher/blob/master/windows/mc_start.bat). Click with right mouse button on **Raw** then click on **Save as...** and save file to your desired location.

## 2. Minecraft Client ##
By default, script will run Minecraft from the default directory `%APPDATA%\.minecraft`.  
If you don't have a client, download [launcher](https://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar), log in with Demo account and download Minecraft client.  
After this, you may close official launcher and enjoy playing full version of Minecraft.

## 3. Setting up ##
This launcher can be customized by editing parameters in source file.
Use right mouse button to open a context menu, then click **edit**.

**List of parameters and values:**

+ `%MC_DIR%` - Minecraft client directory. By default it's `%APPDATA%\.minecraft`.
+ `%GAME_DIR%` - user game files. Resourcepacks, saves, screenshots, etc.
+ `%ASSETS_DIR%` - game libraries directory. Don't modify anything there, unless you know what are you doing.
+ `%NATIVES_DIR%` - native game libraries directory, which are used to launch game on Windows.
[Download](https://github.com/IIIypuk/minecraft-launcher/raw/master/natives/1.14.1.zip) and unpack this to the `versions\`, which is located nearby to the Minecraft client.
+ `%PLAYER%` - player name (shown above the head), by default it's **Steve**.
+ `%WIDTH%` - window width.
+ `%HEIGHT%` - window height.
+ `%RAM%` - amount of RAM (heap size) used by the JVM. **512MB** by default. If your PC has more than **4GB** of RAM, you can surely set it to `-Xmx2G`.


### Русская справка ###
## 1. Установка ##
Перейдите на [страницу лаунчера](https://github.com/IIIypuk/minecraft-launcher/blob/master/mc_start.bat). Правой кнопкой мыши нажмите на **Raw** и выберите пункт **Сохранить как...** и сохраните файл в удобное для Вас место.

## 2. Клиент Minecraft ##
По умолчанию скрипт настроен на запуск Minecraft из стандартной директории `%APPDATA%\.minecraft`.  
Если у Вас нет клиента Minecraft, скачайте с официального сайта [лаунчер](https://s3.amazonaws.com/Minecraft.Download/launcher/Minecraft.jar), зайдите под Demo учётной записью и скачайте клиент Minecraft.  
После этого можно закрыть официальный лаунчер, запустить скачанный лаунчер и наслаждаться игрой в полную версию.

## 3. Настройка ##
Этот лаунчер можно настроить. Настройка производится путём изменения параметров в исходном коде лаунчера.  
Для этого нажмите правой кнопкой мыши по файлу лаунчера и выберите пункт **Изменить**.

**Список параметров и их значений представлены ниже:**

+ `%MC_DIR%` - директория с клиентом Minecraft. По умолчанию `%APPDATA%\.minecraft`.
+ `%GAME_DIR%` - директория с файлами пользователя. Ресурс-паки, сохранения, скриншоты и др.
+ `%ASSETS_DIR%` - директория с библиотеками. Изменять только если Вы понимаете что желаете.
+ `%NATIVES_DIR%` - директория с библиотеками, которые требуеются для запуск игры под Windows.
[Скачиваем](https://github.com/IIIypuk/minecraft-launcher/raw/master/natives/1.14.1.zip) их и распаковываем в директорию `versions\`, которая находится в директории с клиентом Minecraft.
+ `%PLAYER%` - имя игрока. По умолчанию **Steve**.
+ `%WIDTH%` - ширина окна в оконном режиме.
+ `%HEIGHT%` - высота окна в оконном режиме.
+ `%RAM%` - количество оперативной памяти, которое JVM будет использовать. По умолчанию **512MB**. Если у Вас на компьютере оперативной памяти больше **4GB**, то можете смело устанавливать значение `-Xmx2G`.
