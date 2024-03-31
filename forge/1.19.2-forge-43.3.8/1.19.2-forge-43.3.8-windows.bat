@echo off
title Minecraft Launcher

echo Minecraft Launcher by iiiypuk
echo =============================

:: set username
set /p PLAYER=What username would you like? 
IF [%PLAYER%] == [] set PLAYER=Steve

:: main directory of the game
set MC_DIR=%APPDATA%\.minecraft

:: Are stored here...
:: saves/, resourcepacks/ and screenshots/ dirs
:: and options.txt and servers.dat files
set GAME_DIR=%MC_DIR%/userdata/

:: libraries and resource dir (requires no changes)
set ASSETS_DIR=%MC_DIR%\assets
set ASSETS_INDEX=1.19

:: version minecraft (from versions/ dir)
set GAME_VERSION=1.19.2-forge-43.3.8

:: *.jar paths from version.json
set LIBRARIES_LIST=^
%MC_DIR%/libraries/com/mojang/logging/1.0.0/logging-1.0.0.jar;^
%MC_DIR%/libraries/com/mojang/blocklist/1.0.10/blocklist-1.0.10.jar;^
%MC_DIR%/libraries/com/mojang/patchy/2.2.10/patchy-2.2.10.jar;^
%MC_DIR%/libraries/com/github/oshi/oshi-core/5.8.5/oshi-core-5.8.5.jar;^
%MC_DIR%/libraries/net/java/dev/jna/jna/5.10.0/jna-5.10.0.jar;^
%MC_DIR%/libraries/net/java/dev/jna/jna-platform/5.10.0/jna-platform-5.10.0.jar;^
%MC_DIR%/libraries/org/slf4j/slf4j-api/1.8.0-beta4/slf4j-api-1.8.0-beta4.jar;^
%MC_DIR%/libraries/org/apache/logging/log4j/log4j-slf4j18-impl/2.17.0/log4j-slf4j18-impl-2.17.0.jar;^
%MC_DIR%/libraries/com/ibm/icu/icu4j/70.1/icu4j-70.1.jar;^
%MC_DIR%/libraries/com/mojang/javabridge/1.2.24/javabridge-1.2.24.jar;^
%MC_DIR%/libraries/net/sf/jopt-simple/jopt-simple/5.0.4/jopt-simple-5.0.4.jar;^
%MC_DIR%/libraries/io/netty/netty-common/4.1.77.Final/netty-common-4.1.77.Final.jar;^
%MC_DIR%/libraries/io/netty/netty-buffer/4.1.77.Final/netty-buffer-4.1.77.Final.jar;^
%MC_DIR%/libraries/io/netty/netty-codec/4.1.77.Final/netty-codec-4.1.77.Final.jar;^
%MC_DIR%/libraries/io/netty/netty-handler/4.1.77.Final/netty-handler-4.1.77.Final.jar;^
%MC_DIR%/libraries/io/netty/netty-resolver/4.1.77.Final/netty-resolver-4.1.77.Final.jar;^
%MC_DIR%/libraries/io/netty/netty-transport/4.1.77.Final/netty-transport-4.1.77.Final.jar;^
%MC_DIR%/libraries/io/netty/netty-transport-native-unix-common/4.1.77.Final/netty-transport-native-unix-common-4.1.77.Final.jar;^
%MC_DIR%/libraries/io/netty/netty-transport-classes-epoll/4.1.77.Final/netty-transport-classes-epoll-4.1.77.Final.jar;^
%MC_DIR%/libraries/com/google/guava/failureaccess/1.0.1/failureaccess-1.0.1.jar;^
%MC_DIR%/libraries/com/google/guava/guava/31.0.1-jre/guava-31.0.1-jre.jar;^
%MC_DIR%/libraries/org/apache/commons/commons-lang3/3.12.0/commons-lang3-3.12.0.jar;^
%MC_DIR%/libraries/commons-io/commons-io/2.11.0/commons-io-2.11.0.jar;^
%MC_DIR%/libraries/commons-codec/commons-codec/1.15/commons-codec-1.15.jar;^
%MC_DIR%/libraries/com/mojang/brigadier/1.0.18/brigadier-1.0.18.jar;^
%MC_DIR%/libraries/com/mojang/datafixerupper/5.0.28/datafixerupper-5.0.28.jar;^
%MC_DIR%/libraries/com/google/code/gson/gson/2.8.9/gson-2.8.9.jar;^
%MC_DIR%/libraries/com/mojang/authlib/3.11.49/authlib-3.11.49.jar;^
%MC_DIR%/libraries/org/apache/commons/commons-compress/1.21/commons-compress-1.21.jar;^
%MC_DIR%/libraries/org/apache/httpcomponents/httpclient/4.5.13/httpclient-4.5.13.jar;^
%MC_DIR%/libraries/commons-logging/commons-logging/1.2/commons-logging-1.2.jar;^
%MC_DIR%/libraries/org/apache/httpcomponents/httpcore/4.4.14/httpcore-4.4.14.jar;^
%MC_DIR%/libraries/it/unimi/dsi/fastutil/8.5.6/fastutil-8.5.6.jar;^
%MC_DIR%/libraries/org/apache/logging/log4j/log4j-api/2.17.0/log4j-api-2.17.0.jar;^
%MC_DIR%/libraries/org/apache/logging/log4j/log4j-core/2.17.0/log4j-core-2.17.0.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl/3.3.1/lwjgl-3.3.1.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl/3.3.1/lwjgl-3.3.1-natives-windows.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl/3.3.1/lwjgl-3.3.1-natives-windows-x86.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-jemalloc/3.3.1/lwjgl-jemalloc-3.3.1.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-jemalloc/3.3.1/lwjgl-jemalloc-3.3.1-natives-windows.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-jemalloc/3.3.1/lwjgl-jemalloc-3.3.1-natives-windows-x86.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-openal/3.3.1/lwjgl-openal-3.3.1.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-openal/3.3.1/lwjgl-openal-3.3.1-natives-windows.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-openal/3.3.1/lwjgl-openal-3.3.1-natives-windows-x86.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-opengl/3.3.1/lwjgl-opengl-3.3.1.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-opengl/3.3.1/lwjgl-opengl-3.3.1-natives-windows.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-opengl/3.3.1/lwjgl-opengl-3.3.1-natives-windows-x86.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-glfw/3.3.1/lwjgl-glfw-3.3.1.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-glfw/3.3.1/lwjgl-glfw-3.3.1-natives-windows.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-glfw/3.3.1/lwjgl-glfw-3.3.1-natives-windows-x86.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-stb/3.3.1/lwjgl-stb-3.3.1.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-stb/3.3.1/lwjgl-stb-3.3.1-natives-windows.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-stb/3.3.1/lwjgl-stb-3.3.1-natives-windows-x86.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-tinyfd/3.3.1/lwjgl-tinyfd-3.3.1.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-tinyfd/3.3.1/lwjgl-tinyfd-3.3.1-natives-windows.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-tinyfd/3.3.1/lwjgl-tinyfd-3.3.1-natives-windows-x86.jar;^
%MC_DIR%/libraries/com/mojang/text2speech/1.16.7/text2speech-1.16.7.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-glfw/3.3.1/lwjgl-glfw-3.3.1-natives-windows-arm64.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-jemalloc/3.3.1/lwjgl-jemalloc-3.3.1-natives-windows-arm64.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-openal/3.3.1/lwjgl-openal-3.3.1-natives-windows-arm64.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-opengl/3.3.1/lwjgl-opengl-3.3.1-natives-windows-arm64.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-stb/3.3.1/lwjgl-stb-3.3.1-natives-windows-arm64.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-tinyfd/3.3.1/lwjgl-tinyfd-3.3.1-natives-windows-arm64.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl/3.3.1/lwjgl-3.3.1-natives-windows-arm64.jar;^
%MC_DIR%/libraries/cpw/mods/securejarhandler/2.1.4/securejarhandler-2.1.4.jar;^
%MC_DIR%/libraries/org/ow2/asm/asm/9.5/asm-9.5.jar;^
%MC_DIR%/libraries/org/ow2/asm/asm-commons/9.5/asm-commons-9.5.jar;^
%MC_DIR%/libraries/org/ow2/asm/asm-tree/9.5/asm-tree-9.5.jar;^
%MC_DIR%/libraries/org/ow2/asm/asm-util/9.5/asm-util-9.5.jar;^
%MC_DIR%/libraries/org/ow2/asm/asm-analysis/9.5/asm-analysis-9.5.jar;^
%MC_DIR%/libraries/net/minecraftforge/accesstransformers/8.0.4/accesstransformers-8.0.4.jar;^
%MC_DIR%/libraries/org/antlr/antlr4-runtime/4.9.1/antlr4-runtime-4.9.1.jar;^
%MC_DIR%/libraries/net/minecraftforge/eventbus/6.0.3/eventbus-6.0.3.jar;^
%MC_DIR%/libraries/net/minecraftforge/forgespi/6.0.0/forgespi-6.0.0.jar;^
%MC_DIR%/libraries/net/minecraftforge/coremods/5.0.1/coremods-5.0.1.jar;^
%MC_DIR%/libraries/cpw/mods/modlauncher/10.0.8/modlauncher-10.0.8.jar;^
%MC_DIR%/libraries/net/minecraftforge/unsafe/0.2.0/unsafe-0.2.0.jar;^
%MC_DIR%/libraries/com/electronwill/night-config/core/3.6.4/core-3.6.4.jar;^
%MC_DIR%/libraries/com/electronwill/night-config/toml/3.6.4/toml-3.6.4.jar;^
%MC_DIR%/libraries/org/apache/maven/maven-artifact/3.8.5/maven-artifact-3.8.5.jar;^
%MC_DIR%/libraries/net/jodah/typetools/0.8.3/typetools-0.8.3.jar;^
%MC_DIR%/libraries/net/minecrell/terminalconsoleappender/1.2.0/terminalconsoleappender-1.2.0.jar;^
%MC_DIR%/libraries/org/jline/jline-reader/3.12.1/jline-reader-3.12.1.jar;^
%MC_DIR%/libraries/org/jline/jline-terminal/3.12.1/jline-terminal-3.12.1.jar;^
%MC_DIR%/libraries/org/spongepowered/mixin/0.8.5/mixin-0.8.5.jar;^
%MC_DIR%/libraries/org/openjdk/nashorn/nashorn-core/15.3/nashorn-core-15.3.jar;^
%MC_DIR%/libraries/net/minecraftforge/JarJarSelector/0.3.16/JarJarSelector-0.3.16.jar;^
%MC_DIR%/libraries/net/minecraftforge/JarJarMetadata/0.3.16/JarJarMetadata-0.3.16.jar;^
%MC_DIR%/libraries/cpw/mods/bootstraplauncher/1.1.2/bootstraplauncher-1.1.2.jar;^
%MC_DIR%/libraries/net/minecraftforge/JarJarFileSystems/0.3.16/JarJarFileSystems-0.3.16.jar;^
%MC_DIR%/libraries/net/minecraftforge/fmlloader/1.19.2-43.3.8/fmlloader-1.19.2-43.3.8.jar;^
%MC_DIR%/versions/$GAME_VERSION/GAME_VERSION.jar

:: player nickname (the over head)
set PLAYER_NAME=%PLAYER%

:: game window resolution
set WINDOW_W=800
set WINDOW_H=640

:: java machine arguments
set JVM_RAM=-Xmx2G
set JVM_ARGS=-XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M

:: running minecraft
cd /d %MC_DIR%

java.exe %JVM_RAM% %JVM_ARGS% ^
-Djava.net.preferIPv6Addresses=system ^
-DignoreList=bootstraplauncher,securejarhandler,asm-commons,asm-util,asm-analysis,asm-tree,asm,JarJarFileSystems,client-extra,fmlcore,javafmllanguage,lowcodelanguage,mclanguage,forge-,1.20.1-forge-47.1.43.jar ^
-p %MC_DIR%/libraries/cpw/mods/bootstraplauncher/1.1.2/bootstraplauncher-1.1.2.jar;%MC_DIR%/libraries/cpw/mods/securejarhandler/2.1.4/securejarhandler-2.1.4.jar;%MC_DIR%/libraries/org/ow2/asm/asm-commons/9.5/asm-commons-9.5.jar;%MC_DIR%/libraries/org/ow2/asm/asm-util/9.5/asm-util-9.5.jar;%MC_DIR%/libraries/org/ow2/asm/asm-analysis/9.5/asm-analysis-9.5.jar;%MC_DIR%/libraries/org/ow2/asm/asm-tree/9.5/asm-tree-9.5.jar;%MC_DIR%/libraries/org/ow2/asm/asm/9.5/asm-9.5.jar;%MC_DIR%/libraries/net/minecraftforge/JarJarFileSystems/0.3.16/JarJarFileSystems-0.3.16.jar ^
-cp %LIBRARIES_LIST% ^
--add-modules ALL-MODULE-PATH ^
--add-opens java.base/java.lang.invoke=ALL-UNNAMED ^
--add-opens java.base/java.util.jar=cpw.mods.securejarhandler ^
--add-opens java.base/java.lang.invoke=cpw.mods.securejarhandler ^
--add-exports java.base/sun.security.util=cpw.mods.securejarhandler ^
--add-exports jdk.naming.dns/com.sun.jndi.dns=java.naming ^
-DignoreList=bootstraplauncher-1.1.2.jar,securejarhandler-2.1.4.jar,asm-commons-9.5.jar,asm-util-9.5.jar,asm-analysis-9.5.jar,asm-tree-9.5.jar,asm-9.5.jar,JarJarFileSystems-0.3.16.jar ^
-DlibraryDirectory=%MC_DIR%/libraries ^
cpw.mods.bootstraplauncher.BootstrapLauncher ^
--launchTarget forgeclient ^
--fml.forgeVersion 43.3.8 ^
--fml.mcVersion 1.19.2 ^
--fml.forgeGroup net.minecraftforge ^
--fml.mcpVersion 20220805.130853 ^
--versionType release ^
--username %PLAYER_NAME% ^
--version %GAME_VERSION% ^
--accessToken 0 --userProperties {} ^
--gameDir %GAME_DIR% ^
--assetsDir %ASSETS_DIR% ^
--assetIndex %ASSETS_INDEX% ^
--width %WINDOW_W% --height %WINDOW_H%
