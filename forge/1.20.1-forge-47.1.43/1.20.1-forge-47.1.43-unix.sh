#!/bin/sh
echo -ne "\033]2;Minecraft Launcher\007"

# Launcher title
echo "Minecraft Launcher by iiiypuk"
echo "============================="

# Set username
read -p "What username would you like? " player
if [ ! $player ]; then
   player="Steve"
fi

# A minecraft root directory
MC_DIR=$HOME/.minecraft

# Are stored here...
# saves/, resourcepacks/ and screenshots/ dirs
# and options.txt and servers.dat files
GAME_DIR=$MC_DIR

# Libraries and resource dir (requires no changes)
ASSETS_DIR=$MC_DIR/assets
ASSETS_INDEX=5

# Get archive from natives/ dir
NATIVES_DIR=/home/user/.minecraft/bin/1.20.1-forge-47.1.43/

# Version minecraft (from versions/ dir)
GAME_VERSION=1.20.1-forge-47.1.43

# *.jar paths from version.json
LIBRARIES_LIST="\
$MC_DIR/libraries/cpw/mods/securejarhandler/2.1.10/securejarhandler-2.1.10.jar:\
$MC_DIR/libraries/org/ow2/asm/asm/9.5/asm-9.5.jar:\
$MC_DIR/libraries/org/ow2/asm/asm-commons/9.5/asm-commons-9.5.jar:\
$MC_DIR/libraries/org/ow2/asm/asm-tree/9.5/asm-tree-9.5.jar:\
$MC_DIR/libraries/org/ow2/asm/asm-util/9.5/asm-util-9.5.jar:\
$MC_DIR/libraries/org/ow2/asm/asm-analysis/9.5/asm-analysis-9.5.jar:\
$MC_DIR/libraries/net/minecraftforge/accesstransformers/8.0.4/accesstransformers-8.0.4.jar:\
$MC_DIR/libraries/org/antlr/antlr4-runtime/4.9.1/antlr4-runtime-4.9.1.jar:\
$MC_DIR/libraries/net/minecraftforge/eventbus/6.0.5/eventbus-6.0.5.jar:\
$MC_DIR/libraries/net/minecraftforge/forgespi/7.0.1/forgespi-7.0.1.jar:\
$MC_DIR/libraries/net/minecraftforge/coremods/5.0.1/coremods-5.0.1.jar:\
$MC_DIR/libraries/cpw/mods/modlauncher/10.0.9/modlauncher-10.0.9.jar:\
$MC_DIR/libraries/net/minecraftforge/unsafe/0.2.0/unsafe-0.2.0.jar:\
$MC_DIR/libraries/net/minecraftforge/mergetool/1.1.5/mergetool-1.1.5-api.jar:\
$MC_DIR/libraries/com/electronwill/night-config/core/3.6.4/core-3.6.4.jar:\
$MC_DIR/libraries/com/electronwill/night-config/toml/3.6.4/toml-3.6.4.jar:\
$MC_DIR/libraries/org/apache/maven/maven-artifact/3.8.5/maven-artifact-3.8.5.jar:\
$MC_DIR/libraries/net/jodah/typetools/0.6.3/typetools-0.6.3.jar:\
$MC_DIR/libraries/net/minecrell/terminalconsoleappender/1.2.0/terminalconsoleappender-1.2.0.jar:\
$MC_DIR/libraries/org/jline/jline-reader/3.12.1/jline-reader-3.12.1.jar:\
$MC_DIR/libraries/org/jline/jline-terminal/3.12.1/jline-terminal-3.12.1.jar:\
$MC_DIR/libraries/org/spongepowered/mixin/0.8.5/mixin-0.8.5.jar:\
$MC_DIR/libraries/org/openjdk/nashorn/nashorn-core/15.3/nashorn-core-15.3.jar:\
$MC_DIR/libraries/net/minecraftforge/JarJarSelector/0.3.19/JarJarSelector-0.3.19.jar:\
$MC_DIR/libraries/net/minecraftforge/JarJarMetadata/0.3.19/JarJarMetadata-0.3.19.jar:\
$MC_DIR/libraries/cpw/mods/bootstraplauncher/1.1.2/bootstraplauncher-1.1.2.jar:\
$MC_DIR/libraries/net/minecraftforge/JarJarFileSystems/0.3.19/JarJarFileSystems-0.3.19.jar:\
$MC_DIR/libraries/net/minecraftforge/fmlloader/1.20.1-47.1.43/fmlloader-1.20.1-47.1.43.jar:\
$MC_DIR/libraries/net/minecraftforge/fmlearlydisplay/1.20.1-47.1.43/fmlearlydisplay-1.20.1-47.1.43.jar:\
$MC_DIR/libraries/com/github/oshi/oshi-core/6.2.2/oshi-core-6.2.2.jar:\
$MC_DIR/libraries/com/google/code/gson/gson/2.10/gson-2.10.jar:\
$MC_DIR/libraries/com/google/guava/failureaccess/1.0.1/failureaccess-1.0.1.jar:\
$MC_DIR/libraries/com/google/guava/guava/31.1-jre/guava-31.1-jre.jar:\
$MC_DIR/libraries/com/ibm/icu/icu4j/71.1/icu4j-71.1.jar:\
$MC_DIR/libraries/com/mojang/authlib/4.0.43/authlib-4.0.43.jar:\
$MC_DIR/libraries/com/mojang/blocklist/1.0.10/blocklist-1.0.10.jar:\
$MC_DIR/libraries/com/mojang/brigadier/1.1.8/brigadier-1.1.8.jar:\
$MC_DIR/libraries/com/mojang/datafixerupper/6.0.8/datafixerupper-6.0.8.jar:\
$MC_DIR/libraries/com/mojang/logging/1.1.1/logging-1.1.1.jar:\
$MC_DIR/libraries/com/mojang/patchy/2.2.10/patchy-2.2.10.jar:\
$MC_DIR/libraries/com/mojang/text2speech/1.17.9/text2speech-1.17.9.jar:\
$MC_DIR/libraries/commons-codec/commons-codec/1.15/commons-codec-1.15.jar:\
$MC_DIR/libraries/commons-io/commons-io/2.11.0/commons-io-2.11.0.jar:\
$MC_DIR/libraries/commons-logging/commons-logging/1.2/commons-logging-1.2.jar:\
$MC_DIR/libraries/io/netty/netty-buffer/4.1.82.Final/netty-buffer-4.1.82.Final.jar:\
$MC_DIR/libraries/io/netty/netty-codec/4.1.82.Final/netty-codec-4.1.82.Final.jar:\
$MC_DIR/libraries/io/netty/netty-common/4.1.82.Final/netty-common-4.1.82.Final.jar:\
$MC_DIR/libraries/io/netty/netty-handler/4.1.82.Final/netty-handler-4.1.82.Final.jar:\
$MC_DIR/libraries/io/netty/netty-resolver/4.1.82.Final/netty-resolver-4.1.82.Final.jar:\
$MC_DIR/libraries/io/netty/netty-transport-classes-epoll/4.1.82.Final/netty-transport-classes-epoll-4.1.82.Final.jar:\
$MC_DIR/libraries/io/netty/netty-transport-native-epoll/4.1.82.Final/netty-transport-native-epoll-4.1.82.Final-linux-aarch_64.jar:\
$MC_DIR/libraries/io/netty/netty-transport-native-epoll/4.1.82.Final/netty-transport-native-epoll-4.1.82.Final-linux-x86_64.jar:\
$MC_DIR/libraries/io/netty/netty-transport-native-unix-common/4.1.82.Final/netty-transport-native-unix-common-4.1.82.Final.jar:\
$MC_DIR/libraries/io/netty/netty-transport/4.1.82.Final/netty-transport-4.1.82.Final.jar:\
$MC_DIR/libraries/it/unimi/dsi/fastutil/8.5.9/fastutil-8.5.9.jar:\
$MC_DIR/libraries/net/java/dev/jna/jna-platform/5.12.1/jna-platform-5.12.1.jar:\
$MC_DIR/libraries/net/java/dev/jna/jna/5.12.1/jna-5.12.1.jar:\
$MC_DIR/libraries/net/sf/jopt-simple/jopt-simple/5.0.4/jopt-simple-5.0.4.jar:\
$MC_DIR/libraries/org/apache/commons/commons-compress/1.21/commons-compress-1.21.jar:\
$MC_DIR/libraries/org/apache/commons/commons-lang3/3.12.0/commons-lang3-3.12.0.jar:\
$MC_DIR/libraries/org/apache/httpcomponents/httpclient/4.5.13/httpclient-4.5.13.jar:\
$MC_DIR/libraries/org/apache/httpcomponents/httpcore/4.4.15/httpcore-4.4.15.jar:\
$MC_DIR/libraries/org/apache/logging/log4j/log4j-api/2.19.0/log4j-api-2.19.0.jar:\
$MC_DIR/libraries/org/apache/logging/log4j/log4j-core/2.19.0/log4j-core-2.19.0.jar:\
$MC_DIR/libraries/org/apache/logging/log4j/log4j-slf4j2-impl/2.19.0/log4j-slf4j2-impl-2.19.0.jar:\
$MC_DIR/libraries/org/joml/joml/1.10.5/joml-1.10.5.jar:\
$MC_DIR/libraries/org/lwjgl/lwjgl-glfw/3.3.1/lwjgl-glfw-3.3.1.jar:\
$MC_DIR/libraries/org/lwjgl/lwjgl-glfw/3.3.1/lwjgl-glfw-3.3.1-natives-linux.jar:\
$MC_DIR/libraries/org/lwjgl/lwjgl-jemalloc/3.3.1/lwjgl-jemalloc-3.3.1.jar:\
$MC_DIR/libraries/org/lwjgl/lwjgl-jemalloc/3.3.1/lwjgl-jemalloc-3.3.1-natives-linux.jar:\
$MC_DIR/libraries/org/lwjgl/lwjgl-openal/3.3.1/lwjgl-openal-3.3.1.jar:\
$MC_DIR/libraries/org/lwjgl/lwjgl-openal/3.3.1/lwjgl-openal-3.3.1-natives-linux.jar:\
$MC_DIR/libraries/org/lwjgl/lwjgl-opengl/3.3.1/lwjgl-opengl-3.3.1.jar:\
$MC_DIR/libraries/org/lwjgl/lwjgl-opengl/3.3.1/lwjgl-opengl-3.3.1-natives-linux.jar:\
$MC_DIR/libraries/org/lwjgl/lwjgl-stb/3.3.1/lwjgl-stb-3.3.1.jar:\
$MC_DIR/libraries/org/lwjgl/lwjgl-stb/3.3.1/lwjgl-stb-3.3.1-natives-linux.jar:\
$MC_DIR/libraries/org/lwjgl/lwjgl-tinyfd/3.3.1/lwjgl-tinyfd-3.3.1.jar:\
$MC_DIR/libraries/org/lwjgl/lwjgl-tinyfd/3.3.1/lwjgl-tinyfd-3.3.1-natives-linux.jar:\
$MC_DIR/libraries/org/lwjgl/lwjgl/3.3.1/lwjgl-3.3.1.jar:\
$MC_DIR/libraries/org/lwjgl/lwjgl/3.3.1/lwjgl-3.3.1-natives-linux.jar:\
$MC_DIR/libraries/org/slf4j/slf4j-api/2.0.1/slf4j-api-2.0.1.jar:\
$MC_DIR/versions/1.20.1-forge-47.1.43/1.20.1-forge-47.1.43.jar"

# Player nickname (the over head)
PLAYER_NAME=$player

# Game window resolution
WINDOW_W=800
WINDOW_H=640

# Java machine arguments
JVM_RAM="-Xmx2G"
JVM_ARGS="-XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M"

# Running minecraft
cd $MC_DIR

$MC_DIR/runtime/java-runtime-gamma/linux/java-runtime-gamma/bin/java \
$JVM_RAM $JVM_ARGS \
-DignoreList=bootstraplauncher,securejarhandler,asm-commons,asm-util,asm-analysis,asm-tree,asm,JarJarFileSystems,client-extra,fmlcore,javafmllanguage,lowcodelanguage,mclanguage,forge-,1.20.1-forge-47.1.43.jar \
-p $MC_DIR/libraries/cpw/mods/bootstraplauncher/1.1.2/bootstraplauncher-1.1.2.jar:$MC_DIR/libraries/cpw/mods/securejarhandler/2.1.10/securejarhandler-2.1.10.jar:$MC_DIR/libraries/org/ow2/asm/asm-commons/9.5/asm-commons-9.5.jar:$MC_DIR/libraries/org/ow2/asm/asm-util/9.5/asm-util-9.5.jar:$MC_DIR/libraries/org/ow2/asm/asm-analysis/9.5/asm-analysis-9.5.jar:$MC_DIR/libraries/org/ow2/asm/asm-tree/9.5/asm-tree-9.5.jar:$MC_DIR/libraries/org/ow2/asm/asm/9.5/asm-9.5.jar:$MC_DIR/libraries/net/minecraftforge/JarJarFileSystems/0.3.19/JarJarFileSystems-0.3.19.jar:$MC_DIR/versions/1.20.1-forge-47.1.43/1.20.1-forge-47.1.43.jar \
-cp $LIBRARIES_LIST \
--add-modules ALL-MODULE-PATH \
--add-opens java.base/java.lang.invoke=ALL-UNNAMED \
--add-opens java.base/java.util.jar=cpw.mods.securejarhandler \
--add-opens java.base/java.lang.invoke=cpw.mods.securejarhandler \
--add-exports java.base/sun.security.util=cpw.mods.securejarhandler \
--add-exports jdk.naming.dns/com.sun.jndi.dns=java.naming \
-DlibraryDirectory=/home/user/.minecraft/libraries \
-Djava.library.path=$NATIVES_DIR \
cpw.mods.bootstraplauncher.BootstrapLauncher \
--launchTarget forgeclient \
--fml.forgeVersion 47.1.43 \
--fml.mcVersion 1.20.1 \
--fml.forgeGroup net.minecraftforge \
--fml.mcpVersion 20230612.114412 \
--versionType release \
--username $PLAYER_NAME \
--version $GAME_VERSION \
--accessToken 0 --userProperties {} \
--gameDir $GAME_DIR \
--assetsDir $ASSETS_DIR \
--assetIndex $ASSETS_INDEX \
--width $WINDOW_W --height $WINDOW_H


