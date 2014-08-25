@echo off
title Debug Console
cd \

:: main directory of the game
set MC_DIR=%APPDATA%\.minecraft

:: Are stored here...
:: saves/, resourcepacks/ and screenshots/ dirs
:: and options.txt and servers.dat files
set GAME_DIR=%MC_DIR%\profile

:: libraries and resource dir (requires no changes)
set ASSETS_DIR=%MC_DIR%\assets

set ASSETS_INDEX=1.7.10

:: version minecraft (from versions/ dir)
set VERSION=1.7.10

:: get archive from natives/ dir
set NATIVES_DIR=%MC_DIR%\versions\%VERSION%\%VERSION%-natives

:: player nickname (the over head)
set PLAYER=Steve

:: resolution
set WIDTH=854
set HEIGHT=480

:: RAM
set RAM="-Xmx512M"

:: running minecraft
cd %MC_DIR%

java %RAM% -Djava.library.path=%NATIVES_DIR% -cp %MC_DIR%\libraries\com\google\code\gson\gson\2.2.4\gson-2.2.4.jar;%MC_DIR%\libraries\com\google\guava\guava\15.0\guava-15.0.jar;%MC_DIR%\libraries\com\ibm\icu\icu4j-core-mojang\51.2\icu4j-core-mojang-51.2.jar;%MC_DIR%\libraries\com\mojang\authlib\1.5.16\authlib-1.5.16.jar;%MC_DIR%\libraries\com\mojang\realms\1.3.5\realms-1.3.5.jar;%MC_DIR%\libraries\com\paulscode\codecjorbis\20101023\codecjorbis-20101023.jar;%MC_DIR%\libraries\com\paulscode\codecwav\20101023\codecwav-20101023.jar;%MC_DIR%\libraries\com\paulscode\libraryjavasound\20101123\libraryjavasound-20101123.jar;%MC_DIR%\libraries\com\paulscode\librarylwjglopenal\20100824\librarylwjglopenal-20100824.jar;%MC_DIR%\libraries\com\paulscode\soundsystem\20120107\soundsystem-20120107.jar;%MC_DIR%\libraries\commons-codec\commons-codec\1.9\commons-codec-1.9.jar;%MC_DIR%\libraries\commons-io\commons-io\2.4\commons-io-2.4.jar;%MC_DIR%\libraries\commons-logging\commons-logging\1.1.3\commons-logging-1.1.3.jar;%MC_DIR%\libraries\io\netty\netty-all\4.0.10.Final\netty-all-4.0.10.Final.jar;%MC_DIR%\libraries\java3d\vecmath\1.3.1\vecmath-1.3.1.jar;%MC_DIR%\libraries\net\java\jinput\jinput\2.0.5\jinput-2.0.5.jar;%MC_DIR%\libraries\net\java\jinput\jinput-platform\2.0.5\jinput-platform-2.0.5-natives-windows.jar;%MC_DIR%\libraries\net\java\jutils\jutils\1.0.0\jutils-1.0.0.jar;%MC_DIR%\libraries\net\sf\jopt-simple\jopt-simple\4.5\jopt-simple-4.5.jar;%MC_DIR%\libraries\net\sf\trove4j\trove4j\3.0.3\trove4j-3.0.3.jar;%MC_DIR%\libraries\org\apache\commons\commons-compress\1.8.1\commons-compress-1.8.1.jar;%MC_DIR%\libraries\org\apache\commons\commons-lang3\3.1\commons-lang3-3.1.jar;%MC_DIR%\libraries\org\apache\httpcomponents\httpclient\4.3.3\httpclient-4.3.3.jar;%MC_DIR%\libraries\org\apache\httpcomponents\httpcore\4.3.2\httpcore-4.3.2.jar;%MC_DIR%\libraries\org\apache\logging\log4j\log4j-api\2.0-beta9\log4j-api-2.0-beta9.jar;%MC_DIR%\libraries\org\apache\logging\log4j\log4j-core\2.0-beta9\log4j-core-2.0-beta9.jar;%MC_DIR%\libraries\org\lwjgl\lwjgl\lwjgl\2.9.1\lwjgl-2.9.1.jar;%MC_DIR%\libraries\org\lwjgl\lwjgl\lwjgl-platform\2.9.1\lwjgl-platform-2.9.1-natives-windows.jar;%MC_DIR%\libraries\org\lwjgl\lwjgl\lwjgl_util\2.9.1\lwjgl_util-2.9.1.jar;%MC_DIR%\libraries\tv\twitch\twitch\5.16\twitch-5.16.jar;%MC_DIR%\libraries\tv\twitch\twitch-external-platform\4.5\twitch-external-platform-4.5-natives-windows-32.jar;%MC_DIR%\libraries\tv\twitch\twitch-platform\5.16\twitch-platform-5.16-natives-windows-32.jar;%MC_DIR%\versions\%VERSION%\%VERSION%.jar net.minecraft.client.main.Main --username %PLAYER% --version %VERSION% --accessToken 0 --userProperties {} --gameDir %GAME_DIR% --assetsDir %ASSETS_DIR% --assetIndex %ASSETS_INDEX% --width %WIDTH% --height %HEIGHT%
