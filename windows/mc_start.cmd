@echo off
title Minecraft Launcher

:: main directory of the game
set MC_DIR=%APPDATA%\.minecraft

:: Are stored here...
:: saves/, resourcepacks/ and screenshots/ dirs
:: and options.txt and servers.dat files
set GAME_DIR=%MC_DIR%\profile

:: libraries and resource dir (requires no changes)
set ASSETS_DIR=%MC_DIR%\assets

set ASSETS_INDEX=1.14

:: version minecraft (from versions/ dir)
set VERSION=1.14.2

:: get archive from natives/ dir
set NATIVES_DIR=%MC_DIR%\versions\%VERSION%\%VERSION%-natives-246558324433200

:: player nickname (the over head)
set PLAYER=Steve

:: resolution
set WIDTH=800
set HEIGHT=640

:: running minecraft
%SystemDrive%
cd %MC_DIR%

javaw.exe -Xmx1G -XX:+UseConcMarkSweepGC -XX:-UseAdaptiveSizePolicy -Xmn128M -XX:HeapDumpPath=MojangTricksIntelDriversForPerformance_javaw.exe_minecraft.exe.heapdump ^
-Djava.library.path=%NATIVES_DIR% ^
-Dminecraft.launcher.brand=java-minecraft-launcher ^
-Dminecraft.launcher.version=1.6.89-j ^
-cp ^
%MC_DIR%\libraries\com\mojang\patchy\1.1\patchy-1.1.jar;^
%MC_DIR%\libraries\oshi-project\oshi-core\1.1\oshi-core-1.1.jar;^
%MC_DIR%\libraries\net\java\dev\jna\jna\4.4.0\jna-4.4.0.jar;^
%MC_DIR%\libraries\net\java\dev\jna\platform\3.4.0\platform-3.4.0.jar;^
%MC_DIR%\libraries\com\ibm\icu\icu4j-core-mojang\51.2\icu4j-core-mojang-51.2.jar;^
%MC_DIR%\libraries\com\mojang\javabridge\1.0.22\javabridge-1.0.22.jar;^
%MC_DIR%\libraries\net\sf\jopt-simple\jopt-simple\5.0.3\jopt-simple-5.0.3.jar;^
%MC_DIR%\libraries\io\netty\netty-all\4.1.25.Final\netty-all-4.1.25.Final.jar;^
%MC_DIR%\libraries\com\google\guava\guava\21.0\guava-21.0.jar;^
%MC_DIR%\libraries\org\apache\commons\commons-lang3\3.5\commons-lang3-3.5.jar;^
%MC_DIR%\libraries\commons-io\commons-io\2.5\commons-io-2.5.jar;^
%MC_DIR%\libraries\commons-codec\commons-codec\1.10\commons-codec-1.10.jar;^
%MC_DIR%\libraries\net\java\jinput\jinput\2.0.5\jinput-2.0.5.jar;^
%MC_DIR%\libraries\net\java\jutils\jutils\1.0.0\jutils-1.0.0.jar;^
%MC_DIR%\libraries\com\mojang\brigadier\1.0.17\brigadier-1.0.17.jar;^
%MC_DIR%\libraries\com\mojang\datafixerupper\2.0.24\datafixerupper-2.0.24.jar;^
%MC_DIR%\libraries\com\google\code\gson\gson\2.8.0\gson-2.8.0.jar;^
%MC_DIR%\libraries\com\mojang\authlib\1.5.25\authlib-1.5.25.jar;^
%MC_DIR%\libraries\org\apache\commons\commons-compress\1.8.1\commons-compress-1.8.1.jar;^
%MC_DIR%\libraries\org\apache\httpcomponents\httpclient\4.3.3\httpclient-4.3.3.jar;^
%MC_DIR%\libraries\commons-logging\commons-logging\1.1.3\commons-logging-1.1.3.jar;^
%MC_DIR%\libraries\org\apache\httpcomponents\httpcore\4.3.2\httpcore-4.3.2.jar;^
%MC_DIR%\libraries\it\unimi\dsi\fastutil\8.2.1\fastutil-8.2.1.jar;^
%MC_DIR%\libraries\org\apache\logging\log4j\log4j-api\2.8.1\log4j-api-2.8.1.jar;^
%MC_DIR%\libraries\org\apache\logging\log4j\log4j-core\2.8.1\log4j-core-2.8.1.jar;^
%MC_DIR%\libraries\com\mojang\realms\1.14.15\realms-1.14.15.jar;^
%MC_DIR%\libraries\org\lwjgl\lwjgl\3.2.1\lwjgl-3.2.1.jar;^
%MC_DIR%\libraries\org\lwjgl\lwjgl-jemalloc\3.2.1\lwjgl-jemalloc-3.2.1.jar;^
%MC_DIR%\libraries\org\lwjgl\lwjgl-openal\3.2.1\lwjgl-openal-3.2.1.jar;^
%MC_DIR%\libraries\org\lwjgl\lwjgl-opengl\3.2.1\lwjgl-opengl-3.2.1.jar;^
%MC_DIR%\libraries\org\lwjgl\lwjgl-glfw\3.2.1\lwjgl-glfw-3.2.1.jar;^
%MC_DIR%\libraries\org\lwjgl\lwjgl-stb\3.2.1\lwjgl-stb-3.2.1.jar;^
%MC_DIR%\libraries\com\mojang\text2speech\1.11.3\text2speech-1.11.3.jar;^
%MC_DIR%\versions\%VERSION%\%VERSION%.jar ^
net.minecraft.client.main.Main --username %PLAYER% --version %VERSION% --accessToken 0 --userProperties {} --gameDir %GAME_DIR% --assetsDir %ASSETS_DIR% --assetIndex %ASSETS_INDEX% --width %WIDTH% --height %HEIGHT%
