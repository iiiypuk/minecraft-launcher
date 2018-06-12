# A minecraft root directory
MC_DIR=~/.minecraft

# Game location
GAME_DIR=$MC_DIR/profile

# Assets location
ASSETS_DIR=$MC_DIR/assets

# Version to use
VERSION=1.11.2

# Native libs location
NATIVES_DIR=$MC_DIR/versions/$VERSION/$VERSION-natives

# Player name
PLAYER=Steve

# Window properties
WIDTH=800
HEIGHT=640

# JVM args
JVM_ARGS="-Xmx1G -Xms512M"

cd $MC_DIR

java $JVM_ARGS -Djava.library.path=%NATIVES_DIR% -cp $MC_DIR/libraries/com/mojang/netty/1.6/netty-1.6.jar;$MC_DIR/libraries/oshi-project/oshi-core/1.1/oshi-core-1.1.jar;$MC_DIR/libraries/net/java/dev/jna/jna/3.4.0/jna-3.4.0.jar;$MC_DIR/libraries/net/java/dev/jna/platform/3.4.0/platform-3.4.0.jar;$MC_DIR/libraries/com/ibm/icu/icu4j-core-mojang/51.2/icu4j-core-mojang-51.2.jar;$MC_DIR/libraries/net/sf/jopt-simple/jopt-simple/4.6/jopt-simple-4.6.jar;$MC_DIR/libraries/com/paulscode/codecjorbis/20101023/codecjorbis-20101023.jar;$MC_DIR/libraries/com/paulscode/codecwav/20101023/codecwav-20101023.jar;$MC_DIR/libraries/com/paulscode/libraryjavasound/20101123/libraryjavasound-20101123.jar;$MC_DIR/libraries/com/paulscode/librarylwjglopenal/20100824/librarylwjglopenal-20100824.jar;$MC_DIR/libraries/com/paulscode/soundsystem/20120107/soundsystem-20120107.jar;$MC_DIR/libraries/io/netty/netty-all/4.0.23.Final/netty-all-4.0.23.Final.jar;$MC_DIR/libraries/com/google/guava/guava/17.0/guava-17.0.jar;$MC_DIR/libraries/org/apache/commons/commons-lang3/3.3.2/commons-lang3-3.3.2.jar;$MC_DIR/libraries/commons-io/commons-io/2.4/commons-io-2.4.jar;$MC_DIR/libraries/commons-codec/commons-codec/1.9/commons-codec-1.9.jar;$MC_DIR/libraries/net/java/jinput/jinput/2.0.5/jinput-2.0.5.jar;$MC_DIR/libraries/net/java/jutils/jutils/1.0.0/jutils-1.0.0.jar;$MC_DIR/libraries/com/google/code/gson/gson/2.2.4/gson-2.2.4.jar;$MC_DIR/libraries/com/mojang/authlib/1.5.24/authlib-1.5.24.jar;$MC_DIR/libraries/com/mojang/realms/1.10.8/realms-1.10.8.jar;$MC_DIR/libraries/org/apache/commons/commons-compress/1.8.1/commons-compress-1.8.1.jar;$MC_DIR/libraries/org/apache/httpcomponents/httpclient/4.3.3/httpclient-4.3.3.jar;$MC_DIR/libraries/commons-logging/commons-logging/1.1.3/commons-logging-1.1.3.jar;$MC_DIR/libraries/org/apache/httpcomponents/httpcore/4.3.2/httpcore-4.3.2.jar;$MC_DIR/libraries/it/unimi/dsi/fastutil/7.0.12_mojang/fastutil-7.0.12_mojang.jar;$MC_DIR/libraries/org/apache/logging/log4j/log4j-api/2.0-beta9/log4j-api-2.0-beta9.jar;$MC_DIR/libraries/org/apache/logging/log4j/log4j-core/2.0-beta9/log4j-core-2.0-beta9.jar;$MC_DIR/libraries/org/lwjgl/lwjgl/lwjgl/2.9.4-nightly-20150209/lwjgl-2.9.4-nightly-20150209.jar;$MC_DIR/libraries/org/lwjgl/lwjgl/lwjgl_util/2.9.4-nightly-20150209/lwjgl_util-2.9.4-nightly-20150209.jar;$MC_DIR/versions/%VERSION%/%VERSION%.jar net.minecraft.client.main.Main --username %PLAYER% --version %VERSION% --accessToken 0 --userProperties {} --gameDir %GAME_DIR% --assetsDir %ASSETS_DIR% --assetIndex %ASSETS_INDEX% --width $WIDTH --height $HEIGHT
