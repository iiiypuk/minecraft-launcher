@echo off
title Minecraft Launcher

echo Minecraft Launcher by iiiypuk
echo =============================

:: set username
set /p PLAYER=What username would you like? 
IF [%PLAYER%] == [] set PLAYER=Steve

:: main directory of the game
set MC_DIR=.\

:: Are stored here...
:: saves/, resourcepacks/ and screenshots/ dirs
:: and options.txt and servers.dat files
set GAME_DIR=%MC_DIR%

:: libraries and resource dir (requires no changes)
set ASSETS_DIR=%MC_DIR%\assets
set ASSETS_INDEX=1.16

:: get archive from natives/ dir
set NATIVES_DIR=%MC_DIR%\bin\1.16.5

:: version minecraft (from versions/ dir)
set GAME_VERSION=1.16.5-forge-36.2.34

:: *.jar paths from version.json
set LIBRARIES_LIST=^
%MC_DIR%/libraries/net/minecraftforge/forge/1.16.5-36.2.34/forge-1.16.5-36.2.34.jar;^
%MC_DIR%/libraries/org/ow2/asm/asm/9.1/asm-9.1.jar;^
%MC_DIR%/libraries/org/ow2/asm/asm-commons/9.1/asm-commons-9.1.jar;^
%MC_DIR%/libraries/org/ow2/asm/asm-tree/9.1/asm-tree-9.1.jar;^
%MC_DIR%/libraries/org/ow2/asm/asm-util/9.1/asm-util-9.1.jar;^
%MC_DIR%/libraries/org/ow2/asm/asm-analysis/9.1/asm-analysis-9.1.jar;^
%MC_DIR%/libraries/cpw/mods/modlauncher/8.1.3/modlauncher-8.1.3.jar;^
%MC_DIR%/libraries/cpw/mods/grossjava9hacks/1.3.3/grossjava9hacks-1.3.3.jar;^
%MC_DIR%/libraries/net/minecraftforge/accesstransformers/3.0.1/accesstransformers-3.0.1.jar;^
%MC_DIR%/libraries/org/antlr/antlr4-runtime/4.9.1/antlr4-runtime-4.9.1.jar;^
%MC_DIR%/libraries/net/minecraftforge/eventbus/4.0.0/eventbus-4.0.0.jar;^
%MC_DIR%/libraries/net/minecraftforge/forgespi/3.2.0/forgespi-3.2.0.jar;^
%MC_DIR%/libraries/net/minecraftforge/coremods/4.0.6/coremods-4.0.6.jar;^
%MC_DIR%/libraries/net/minecraftforge/unsafe/0.2.0/unsafe-0.2.0.jar;^
%MC_DIR%/libraries/com/electronwill/night-config/core/3.6.3/core-3.6.3.jar;^
%MC_DIR%/libraries/com/electronwill/night-config/toml/3.6.3/toml-3.6.3.jar;^
%MC_DIR%/libraries/org/jline/jline/3.12.1/jline-3.12.1.jar;^
%MC_DIR%/libraries/org/apache/maven/maven-artifact/3.6.3/maven-artifact-3.6.3.jar;^
%MC_DIR%/libraries/net/jodah/typetools/0.8.3/typetools-0.8.3.jar;^
%MC_DIR%/libraries/org/apache/logging/log4j/log4j-api/2.15.0/log4j-api-2.15.0.jar;^
%MC_DIR%/libraries/org/apache/logging/log4j/log4j-core/2.15.0/log4j-core-2.15.0.jar;^
%MC_DIR%/libraries/org/apache/logging/log4j/log4j-slf4j18-impl/2.15.0/log4j-slf4j18-impl-2.15.0.jar;^
%MC_DIR%/libraries/net/minecrell/terminalconsoleappender/1.2.0/terminalconsoleappender-1.2.0.jar;^
%MC_DIR%/libraries/net/sf/jopt-simple/jopt-simple/5.0.4/jopt-simple-5.0.4.jar;^
%MC_DIR%/libraries/org/spongepowered/mixin/0.8.4/mixin-0.8.4.jar;^
%MC_DIR%/libraries/net/minecraftforge/nashorn-core-compat/15.1.1.1/nashorn-core-compat-15.1.1.1.jar;^
%MC_DIR%/libraries/com/mojang/patchy/1.3.9/patchy-1.3.9.jar;^
%MC_DIR%/libraries/oshi-project/oshi-core/1.1/oshi-core-1.1.jar;^
%MC_DIR%/libraries/net/java/dev/jna/jna/4.4.0/jna-4.4.0.jar;^
%MC_DIR%/libraries/net/java/dev/jna/platform/3.4.0/platform-3.4.0.jar;^
%MC_DIR%/libraries/com/ibm/icu/icu4j/66.1/icu4j-66.1.jar;^
%MC_DIR%/libraries/com/mojang/javabridge/1.0.22/javabridge-1.0.22.jar;^
%MC_DIR%/libraries/net/sf/jopt-simple/jopt-simple/5.0.3/jopt-simple-5.0.3.jar;^
%MC_DIR%/libraries/io/netty/netty-all/4.1.25.Final/netty-all-4.1.25.Final.jar;^
%MC_DIR%/libraries/com/google/guava/guava/21.0/guava-21.0.jar;^
%MC_DIR%/libraries/org/apache/commons/commons-lang3/3.5/commons-lang3-3.5.jar;^
%MC_DIR%/libraries/commons-io/commons-io/2.5/commons-io-2.5.jar;^
%MC_DIR%/libraries/commons-codec/commons-codec/1.10/commons-codec-1.10.jar;^
%MC_DIR%/libraries/net/java/jinput/jinput/2.0.5/jinput-2.0.5.jar;^
%MC_DIR%/libraries/net/java/jutils/jutils/1.0.0/jutils-1.0.0.jar;^
%MC_DIR%/libraries/com/mojang/brigadier/1.0.17/brigadier-1.0.17.jar;^
%MC_DIR%/libraries/com/mojang/datafixerupper/4.0.26/datafixerupper-4.0.26.jar;^
%MC_DIR%/libraries/com/google/code/gson/gson/2.8.0/gson-2.8.0.jar;^
%MC_DIR%/libraries/com/mojang/authlib/2.1.28/authlib-2.1.28.jar;^
%MC_DIR%/libraries/org/apache/commons/commons-compress/1.8.1/commons-compress-1.8.1.jar;^
%MC_DIR%/libraries/org/apache/httpcomponents/httpclient/4.3.3/httpclient-4.3.3.jar;^
%MC_DIR%/libraries/commons-logging/commons-logging/1.1.3/commons-logging-1.1.3.jar;^
%MC_DIR%/libraries/org/apache/httpcomponents/httpcore/4.3.2/httpcore-4.3.2.jar;^
%MC_DIR%/libraries/it/unimi/dsi/fastutil/8.2.1/fastutil-8.2.1.jar;^
%MC_DIR%/libraries/org/apache/logging/log4j/log4j-api/2.8.1/log4j-api-2.8.1.jar;^
%MC_DIR%/libraries/org/apache/logging/log4j/log4j-core/2.8.1/log4j-core-2.8.1.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl/3.2.2/lwjgl-3.2.2.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-jemalloc/3.2.2/lwjgl-jemalloc-3.2.2.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-openal/3.2.2/lwjgl-openal-3.2.2.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-opengl/3.2.2/lwjgl-opengl-3.2.2.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-glfw/3.2.2/lwjgl-glfw-3.2.2.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-stb/3.2.2/lwjgl-stb-3.2.2.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-tinyfd/3.2.2/lwjgl-tinyfd-3.2.2.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl/3.2.2/lwjgl-3.2.2.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-jemalloc/3.2.2/lwjgl-jemalloc-3.2.2.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-openal/3.2.2/lwjgl-openal-3.2.2.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-opengl/3.2.2/lwjgl-opengl-3.2.2.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-glfw/3.2.2/lwjgl-glfw-3.2.2.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-tinyfd/3.2.2/lwjgl-tinyfd-3.2.2.jar;^
%MC_DIR%/libraries/org/lwjgl/lwjgl-stb/3.2.2/lwjgl-stb-3.2.2.jar;^
%MC_DIR%/libraries/com/mojang/text2speech/1.11.3/text2speech-1.11.3.jar;^
%MC_DIR%/libraries/com/mojang/text2speech/1.11.3/text2speech-1.11.3.jar;^
%MC_DIR%/versions/%GAME_VERSION%/%GAME_VERSION%.jar

:: player nickname (the over head)
set PLAYER_NAME=%PLAYER%

:: game window resolution
set WINDOW_W=800
set WINDOW_H=640

:: java machine arguments
set JVM_RAM=-Xmx2G
set JVM_ARGS=-XX:+UnlockExperimentalVMOptions -XX:+IgnoreUnrecognizedVMOptions -XX:+UseG1GC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M -XX:+IgnoreUnrecognizedVMOptions --add-opens=java.base/java.util.jar=ALL-UNNAMED --add-exports=java.base/sun.security.util=ALL-UNNAMED --add-exports=jdk.naming.dns/com.sun.jndi.dns=java.naming --add-exports=java.base/sun.security.util=ALL-UNNAMED --add-exports=jdk.naming.dns/com.sun.jndi.dns=java.naming --add-opens=java.base/java.util.jar=ALL-UNNAMED
:: running minecraft
cd /d %MC_DIR%

java.exe %JVM_RAM% %JVM_ARGS% ^
-Djava.library.path=%NATIVES_DIR% ^
-cp %LIBRARIES_LIST% ^
cpw.mods.modlauncher.Launcher ^
--launchTarget fmlclient ^
--fml.forgeVersion 36.2.34 ^
--fml.mcVersion 1.16.5 ^
--fml.forgeGroup net.minecraftforge ^
--fml.mcpVersion 20210115.111550 ^
--username %PLAYER_NAME% ^
--version %GAME_VERSION% ^
--accessToken 0 --userProperties {} ^
--gameDir %GAME_DIR% ^
--assetsDir %ASSETS_DIR% ^
--assetIndex %ASSETS_INDEX% ^
--width %WINDOW_W% ^
--height %WINDOW_H%
