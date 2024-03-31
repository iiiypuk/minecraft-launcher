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

# Version minecraft (from versions/ dir)
GAME_VERSION=1.20.1

# *.jar paths from version.json
LIBRARIES_LIST="\
$MC_DIR/libraries/ca/weblite/java-objc-bridge/1.1/java-objc-bridge-1.1.jar:\
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
$MC_DIR/libraries/org/lwjgl/lwjgl-glfw/3.3.1/lwjgl-glfw-3.3.1-natives-macos.jar:\
$MC_DIR/libraries/org/lwjgl/lwjgl-glfw/3.3.1/lwjgl-glfw-3.3.1-natives-macos-arm64.jar:\
$MC_DIR/libraries/org/lwjgl/lwjgl-jemalloc/3.3.1/lwjgl-jemalloc-3.3.1.jar:\
$MC_DIR/libraries/org/lwjgl/lwjgl-jemalloc/3.3.1/lwjgl-jemalloc-3.3.1-natives-macos.jar:\
$MC_DIR/libraries/org/lwjgl/lwjgl-jemalloc/3.3.1/lwjgl-jemalloc-3.3.1-natives-macos-arm64.jar:\
$MC_DIR/libraries/org/lwjgl/lwjgl-openal/3.3.1/lwjgl-openal-3.3.1.jar:\
$MC_DIR/libraries/org/lwjgl/lwjgl-openal/3.3.1/lwjgl-openal-3.3.1-natives-macos.jar:\
$MC_DIR/libraries/org/lwjgl/lwjgl-openal/3.3.1/lwjgl-openal-3.3.1-natives-macos-arm64.jar:\
$MC_DIR/libraries/org/lwjgl/lwjgl-opengl/3.3.1/lwjgl-opengl-3.3.1.jar:\
$MC_DIR/libraries/org/lwjgl/lwjgl-opengl/3.3.1/lwjgl-opengl-3.3.1-natives-macos.jar:\
$MC_DIR/libraries/org/lwjgl/lwjgl-opengl/3.3.1/lwjgl-opengl-3.3.1-natives-macos-arm64.jar:\
$MC_DIR/libraries/org/lwjgl/lwjgl-stb/3.3.1/lwjgl-stb-3.3.1.jar:\
$MC_DIR/libraries/org/lwjgl/lwjgl-stb/3.3.1/lwjgl-stb-3.3.1-natives-macos.jar:\
$MC_DIR/libraries/org/lwjgl/lwjgl-stb/3.3.1/lwjgl-stb-3.3.1-natives-macos-arm64.jar:\
$MC_DIR/libraries/org/lwjgl/lwjgl-tinyfd/3.3.1/lwjgl-tinyfd-3.3.1.jar:\
$MC_DIR/libraries/org/lwjgl/lwjgl-tinyfd/3.3.1/lwjgl-tinyfd-3.3.1-natives-macos.jar:\
$MC_DIR/libraries/org/lwjgl/lwjgl-tinyfd/3.3.1/lwjgl-tinyfd-3.3.1-natives-macos-arm64.jar:\
$MC_DIR/libraries/org/lwjgl/lwjgl/3.3.1/lwjgl-3.3.1.jar:\
$MC_DIR/libraries/org/lwjgl/lwjgl/3.3.1/lwjgl-3.3.1-natives-macos.jar:\
$MC_DIR/libraries/org/lwjgl/lwjgl/3.3.1/lwjgl-3.3.1-natives-macos-arm64.jar:\
$MC_DIR/libraries/org/slf4j/slf4j-api/2.0.1/slf4j-api-2.0.1.jar:\
$MC_DIR/versions/$GAME_VERSION/$GAME_VERSION.jar"

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

$HOME/.minecraft/runtime/java-runtime-gamma/linux/java-runtime-gamma/bin/java \
$JVM_RAM $JVM_ARGS \
-cp $LIBRARIES_LIST \
net.minecraft.client.main.Main \
--username $PLAYER_NAME \
--version $GAME_VERSION \
--accessToken 0 --userProperties {} \
--gameDir $GAME_DIR \
--assetsDir $ASSETS_DIR \
--assetIndex $ASSETS_INDEX \
--width $WINDOW_W --height $WINDOW_H
