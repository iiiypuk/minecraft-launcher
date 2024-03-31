@echo off
title Minecraft Launcher

echo Minecraft Launcher by iiiypuk
echo =============================

:: Set username
set /p PLAYER=What username would you like? 
IF [%PLAYER%] == [] set PLAYER=Steve

:: A minecraft root directory
set MC_DIR=%APPDATA%\.minecraft

:: Are stored here...
:: saves/, resourcepacks/ and screenshots/ dirs
:: and options.txt and servers.dat files
set GAME_DIR=%MC_DIR%\userdata

:: Libraries and resource dir (requires no changes)
set ASSETS_DIR=%MC_DIR%\assets
set ASSETS_INDEX=12

:: Version minecraft (from versions/ dir)
set GAME_VERSION=1.20.4

:: Get archive from natives/ dir
NATIVES_DIR=%MC_DIR%\bin\%GAME_VERSION%

:: *.jar paths from version.json
set LIBRARIES_LIST=^
%MC_DIR%/libraries/com/github/oshi/oshi-core/6.4.5/oshi-core-6.4.5.jar;^
%MC_DIR%/libraries/com/google/code/gson/gson/2.10.1/gson-2.10.1.jar;^
%MC_DIR%/libraries/com/google/guava/failureaccess/1.0.1/failureaccess-1.0.1.jar;^
%MC_DIR%/libraries/com/google/guava/guava/32.1.2-jre/guava-32.1.2-jre.jar;^
%MC_DIR%/libraries/com/ibm/icu/icu4j/73.2/icu4j-73.2.jar;^
%MC_DIR%/libraries/com/mojang/authlib/6.0.52/authlib-6.0.52.jar;^
%MC_DIR%/libraries/com/mojang/blocklist/1.0.10/blocklist-1.0.10.jar;^
%MC_DIR%/libraries/com/mojang/brigadier/1.2.9/brigadier-1.2.9.jar;^
%MC_DIR%/libraries/com/mojang/datafixerupper/6.0.8/datafixerupper-6.0.8.jar;^
%MC_DIR%/libraries/com/mojang/logging/1.1.1/logging-1.1.1.jar;^
%MC_DIR%/libraries/com/mojang/patchy/2.2.10/patchy-2.2.10.jar;^
%MC_DIR%/libraries/com/mojang/text2speech/1.17.9/text2speech-1.17.9.jar;^
%MC_DIR%/libraries/commons-codec/commons-codec/1.16.0/commons-codec-1.16.0.jar;^
%MC_DIR%/libraries/commons-io/commons-io/2.13.0/commons-io-2.13.0.jar;^
%MC_DIR%/libraries/commons-logging/commons-logging/1.2/commons-logging-1.2.jar;^
%MC_DIR%/libraries/io/netty/netty-buffer/4.1.97.Final/netty-buffer-4.1.97.Final.jar;^
%MC_DIR%/libraries/io/netty/netty-codec/4.1.97.Final/netty-codec-4.1.97.Final.jar;^
%MC_DIR%/libraries/io/netty/netty-common/4.1.97.Final/netty-common-4.1.97.Final.jar;^
%MC_DIR%/libraries/io/netty/netty-handler/4.1.97.Final/netty-handler-4.1.97.Final.jar;^
%MC_DIR%/libraries/io/netty/netty-resolver/4.1.97.Final/netty-resolver-4.1.97.Final.jar;^
%MC_DIR%/libraries/io/netty/netty-transport-classes-epoll/4.1.97.Final/netty-transport-classes-epoll-4.1.97.Final.jar;^
%MC_DIR%/libraries/io/netty/netty-transport-native-unix-common/4.1.97.Final/netty-transport-native-unix-common-4.1.97.Final.jar;^
%MC_DIR%/libraries/io/netty/netty-transport/4.1.97.Final/netty-transport-4.1.97.Final.jar;^
%MC_DIR%/libraries/it/unimi/dsi/fastutil/8.5.12/fastutil-8.5.12.jar;^
%MC_DIR%/libraries/net/java/dev/jna/jna-platform/5.13.0/jna-platform-5.13.0.jar;^
%MC_DIR%/libraries/net/java/dev/jna/jna/5.13.0/jna-5.13.0.jar;^
%MC_DIR%/libraries/net/sf/jopt-simple/jopt-simple/5.0.4/jopt-simple-5.0.4.jar;^
%MC_DIR%/libraries/org/apache/commons/commons-compress/1.22/commons-compress-1.22.jar;^
%MC_DIR%/libraries/org/apache/commons/commons-lang3/3.13.0/commons-lang3-3.13.0.jar;^
%MC_DIR%/libraries/org/apache/httpcomponents/httpclient/4.5.13/httpclient-4.5.13.jar;^
%MC_DIR%/libraries/org/apache/httpcomponents/httpcore/4.4.16/httpcore-4.4.16.jar;^
%MC_DIR%/libraries/org/apache/logging/log4j/log4j-api/2.19.0/log4j-api-2.19.0.jar;^
%MC_DIR%/libraries/org/apache/logging/log4j/log4j-core/2.19.0/log4j-core-2.19.0.jar;^
%MC_DIR%/libraries/org/apache/logging/log4j/log4j-slf4j2-impl/2.19.0/log4j-slf4j2-impl-2.19.0.jar;^
%MC_DIR%/libraries/org/joml/joml/1.10.5/joml-1.10.5.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-glfw/3.3.2/lwjgl-glfw-3.3.2.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-glfw/3.3.2/lwjgl-glfw-3.3.2-natives-windows.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-glfw/3.3.2/lwjgl-glfw-3.3.2-natives-windows-arm64.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-glfw/3.3.2/lwjgl-glfw-3.3.2-natives-windows-x86.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-jemalloc/3.3.2/lwjgl-jemalloc-3.3.2.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-jemalloc/3.3.2/lwjgl-jemalloc-3.3.2-natives-windows.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-jemalloc/3.3.2/lwjgl-jemalloc-3.3.2-natives-windows-arm64.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-jemalloc/3.3.2/lwjgl-jemalloc-3.3.2-natives-windows-x86.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-openal/3.3.2/lwjgl-openal-3.3.2.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-openal/3.3.2/lwjgl-openal-3.3.2-natives-windows.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-openal/3.3.2/lwjgl-openal-3.3.2-natives-windows-arm64.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-openal/3.3.2/lwjgl-openal-3.3.2-natives-windows-x86.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-opengl/3.3.2/lwjgl-opengl-3.3.2.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-opengl/3.3.2/lwjgl-opengl-3.3.2-natives-windows.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-opengl/3.3.2/lwjgl-opengl-3.3.2-natives-windows-arm64.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-opengl/3.3.2/lwjgl-opengl-3.3.2-natives-windows-x86.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-stb/3.3.2/lwjgl-stb-3.3.2.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-stb/3.3.2/lwjgl-stb-3.3.2-natives-windows.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-stb/3.3.2/lwjgl-stb-3.3.2-natives-windows-arm64.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-stb/3.3.2/lwjgl-stb-3.3.2-natives-windows-x86.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-tinyfd/3.3.2/lwjgl-tinyfd-3.3.2.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-tinyfd/3.3.2/lwjgl-tinyfd-3.3.2-natives-windows.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-tinyfd/3.3.2/lwjgl-tinyfd-3.3.2-natives-windows-arm64.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-tinyfd/3.3.2/lwjgl-tinyfd-3.3.2-natives-windows-x86.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl/3.3.2/lwjgl-3.3.2.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl/3.3.2/lwjgl-3.3.2-natives-windows.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl/3.3.2/lwjgl-3.3.2-natives-windows-arm64.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl/3.3.2/lwjgl-3.3.2-natives-windows-x86.jar;^
%MC_DIR%/libraries/org/slf4j/slf4j-api/2.0.7/slf4j-api-2.0.7.jar;^
%MC_DIR%/versions/%GAME_VERSION%/%GAME_VERSION%.jar

:: Player nickname (the over head)
set PLAYER_NAME=%PLAYER%

:: Game window resolution
set WINDOW_W=800
set WINDOW_H=640

:: Java machine arguments
set JVM_RAM=-Xmx2G
set JVM_ARGS=-XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M

:: Change directory
cd /d %MC_DIR%

:: Prepare game directory
mkdir %GAME_DIR%

:: Running minecraft
java.exe %JVM_RAM% %JVM_ARGS% ^
-cp %LIBRARIES_LIST% ^
net.minecraft.client.main.Main ^
--username %PLAYER_NAME% ^
--version %GAME_VERSION% ^
--accessToken 0 --userProperties {} ^
--gameDir %GAME_DIR% ^
--assetsDir %ASSETS_DIR% ^
--assetIndex %ASSETS_INDEX% ^
--width %WINDOW_W% ^
--height %WINDOW_H%
