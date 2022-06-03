#!/bin/sh
echo -ne "\033]2;Minecraft Launcher\007"

# Set username
read -p "What username would you like?: " player

# A minecraft root directory
MC_DIR=~/.minecraft

# Are stored here...
# saves/, resourcepacks/ and screenshots/ dirs
# and options.txt and servers.dat files
GAME_DIR=$MC_DIR

# Assets location
ASSETS_DIR=$MC_DIR/assets
ASSETS_INDEX=1.18

# Version to use
GAME_VERSION=1.18.2

# Native libs location
NATIVES_DIR=$MC_DIR/bin/$GAME_VERSION

# *.jar paths from version.json
LIBRARIES_LIST="$MC_DIR/libraries/com/mojang/logging/1.0.0/logging-1.0.0.jar:$MC_DIR/libraries/com/mojang/blocklist/1.0.10/blocklist-1.0.10.jar:$MC_DIR/libraries/com/mojang/patchy/2.2.10/patchy-2.2.10.jar:$MC_DIR/libraries/com/github/oshi/oshi-core/5.8.5/oshi-core-5.8.5.jar:$MC_DIR/libraries/net/java/dev/jna/jna/5.10.0/jna-5.10.0.jar:$MC_DIR/libraries/net/java/dev/jna/jna-platform/5.10.0/jna-platform-5.10.0.jar:$MC_DIR/libraries/org/slf4j/slf4j-api/1.8.0-beta4/slf4j-api-1.8.0-beta4.jar:$MC_DIR/libraries/org/apache/logging/log4j/log4j-slf4j18-impl/2.17.0/log4j-slf4j18-impl-2.17.0.jar:$MC_DIR/libraries/com/ibm/icu/icu4j/70.1/icu4j-70.1.jar:$MC_DIR/libraries/com/mojang/javabridge/1.2.24/javabridge-1.2.24.jar:$MC_DIR/libraries/net/sf/jopt-simple/jopt-simple/5.0.4/jopt-simple-5.0.4.jar:$MC_DIR/libraries/io/netty/netty-all/4.1.68.Final/netty-all-4.1.68.Final.jar:$MC_DIR/libraries/com/google/guava/failureaccess/1.0.1/failureaccess-1.0.1.jar:$MC_DIR/libraries/com/google/guava/guava/31.0.1-jre/guava-31.0.1-jre.jar:$MC_DIR/libraries/org/apache/commons/commons-lang3/3.12.0/commons-lang3-3.12.0.jar:$MC_DIR/libraries/commons-io/commons-io/2.11.0/commons-io-2.11.0.jar:$MC_DIR/libraries/commons-codec/commons-codec/1.15/commons-codec-1.15.jar:$MC_DIR/libraries/com/mojang/brigadier/1.0.18/brigadier-1.0.18.jar:$MC_DIR/libraries/com/mojang/datafixerupper/4.1.27/datafixerupper-4.1.27.jar:$MC_DIR/libraries/com/google/code/gson/gson/2.8.9/gson-2.8.9.jar:$MC_DIR/libraries/com/mojang/authlib/3.3.39/authlib-3.3.39.jar:$MC_DIR/libraries/org/apache/commons/commons-compress/1.21/commons-compress-1.21.jar:$MC_DIR/libraries/org/apache/httpcomponents/httpclient/4.5.13/httpclient-4.5.13.jar:$MC_DIR/libraries/commons-logging/commons-logging/1.2/commons-logging-1.2.jar:$MC_DIR/libraries/org/apache/httpcomponents/httpcore/4.4.14/httpcore-4.4.14.jar:$MC_DIR/libraries/it/unimi/dsi/fastutil/8.5.6/fastutil-8.5.6.jar:$MC_DIR/libraries/org/apache/logging/log4j/log4j-api/2.17.0/log4j-api-2.17.0.jar:$MC_DIR/libraries/org/apache/logging/log4j/log4j-core/2.17.0/log4j-core-2.17.0.jar:$MC_DIR/libraries/org/lwjgl/lwjgl/3.2.1/lwjgl-3.2.1.jar:$MC_DIR/libraries/org/lwjgl/lwjgl/3.2.2/lwjgl-3.2.2.jar:$MC_DIR/libraries/org/lwjgl/lwjgl-jemalloc/3.2.1/lwjgl-jemalloc-3.2.1.jar:$MC_DIR/libraries/org/lwjgl/lwjgl-jemalloc/3.2.2/lwjgl-jemalloc-3.2.2.jar:$MC_DIR/libraries/org/lwjgl/lwjgl-openal/3.2.1/lwjgl-openal-3.2.1.jar:$MC_DIR/libraries/org/lwjgl/lwjgl-openal/3.2.2/lwjgl-openal-3.2.2.jar:$MC_DIR/libraries/org/lwjgl/lwjgl-opengl/3.2.1/lwjgl-opengl-3.2.1.jar:$MC_DIR/libraries/org/lwjgl/lwjgl-opengl/3.2.2/lwjgl-opengl-3.2.2.jar:$MC_DIR/libraries/org/lwjgl/lwjgl-glfw/3.2.1/lwjgl-glfw-3.2.1.jar:$MC_DIR/libraries/org/lwjgl/lwjgl-glfw/3.2.2/lwjgl-glfw-3.2.2.jar:$MC_DIR/libraries/org/lwjgl/lwjgl-stb/3.2.1/lwjgl-stb-3.2.1.jar:$MC_DIR/libraries/org/lwjgl/lwjgl-stb/3.2.2/lwjgl-stb-3.2.2.jar:$MC_DIR/libraries/org/lwjgl/lwjgl-tinyfd/3.2.1/lwjgl-tinyfd-3.2.1.jar:$MC_DIR/libraries/org/lwjgl/lwjgl-tinyfd/3.2.2/lwjgl-tinyfd-3.2.2.jar:$MC_DIR/libraries/org/lwjgl/lwjgl/3.2.1/lwjgl-3.2.1.jar:$MC_DIR/libraries/org/lwjgl/lwjgl/3.2.2/lwjgl-3.2.2.jar:$MC_DIR/libraries/org/lwjgl/lwjgl-jemalloc/3.2.1/lwjgl-jemalloc-3.2.1.jar:$MC_DIR/libraries/org/lwjgl/lwjgl-jemalloc/3.2.2/lwjgl-jemalloc-3.2.2.jar:$MC_DIR/libraries/org/lwjgl/lwjgl-openal/3.2.1/lwjgl-openal-3.2.1.jar:$MC_DIR/libraries/org/lwjgl/lwjgl-openal/3.2.2/lwjgl-openal-3.2.2.jar:$MC_DIR/libraries/org/lwjgl/lwjgl-opengl/3.2.1/lwjgl-opengl-3.2.1.jar:$MC_DIR/libraries/org/lwjgl/lwjgl-opengl/3.2.2/lwjgl-opengl-3.2.2.jar:$MC_DIR/libraries/org/lwjgl/lwjgl-glfw/3.2.1/lwjgl-glfw-3.2.1.jar:$MC_DIR/libraries/org/lwjgl/lwjgl-glfw/3.2.2/lwjgl-glfw-3.2.2.jar:$MC_DIR/libraries/org/lwjgl/lwjgl-stb/3.2.1/lwjgl-stb-3.2.1.jar:$MC_DIR/libraries/org/lwjgl/lwjgl-tinyfd/3.2.2/lwjgl-tinyfd-3.2.2.jar:$MC_DIR/libraries/org/lwjgl/lwjgl-tinyfd/3.2.1/lwjgl-tinyfd-3.2.1.jar:$MC_DIR/libraries/org/lwjgl/lwjgl-stb/3.2.2/lwjgl-stb-3.2.2.jar:$MC_DIR/libraries/com/mojang/text2speech/1.12.4/text2speech-1.12.4.jar:$MC_DIR/libraries/com/mojang/text2speech/1.12.4/text2speech-1.12.4.jar:$MC_DIR/libraries/ca/weblite/java-objc-bridge/1.0.0/java-objc-bridge-1.0.0.jar:$MC_DIR/libraries/ca/weblite/java-objc-bridge/1.0.0/java-objc-bridge-1.0.0.jar:$MC_DIR/versions/$GAME_VERSION/$GAME_VERSION.jar"

# Player name
PLAYER_NAME=$player

# Game window resolution
WINDOW_W=800
WINDOW_H=640

# Java machine arguments
JVM_RAM="-Xmx2G"
JVM_ARGS="-XX:+UnlockExperimentalVMOptions -XX:+UseG1GC -XX:G1NewSizePercent=20 -XX:G1ReservePercent=20 -XX:MaxGCPauseMillis=50 -XX:G1HeapRegionSize=32M"

# Running minecraft
cd $MC_DIR

java $JVM_RAM $JVM_ARGS \
-Djava.library.path=$NATIVES_DIR \
-cp $LIBRARIES_LIST \
net.minecraft.client.main.Main \
--username $PLAYER_NAME \
--version $GAME_VERSION \
--accessToken 0 --userProperties {} \
--gameDir $GAME_DIR \
--assetsDir $ASSETS_DIR \
--assetIndex $ASSETS_INDEX \
--width $WINDOW_W --height $WINDOW_H
