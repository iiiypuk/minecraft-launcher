@ECHO OFF
REM  QBFC Project Options Begin
REM  HasVersionInfo: Yes
REM  Companyname: http://iiiypuk.me/
REM  Productname: Minecraft Launcher
REM  Filedescription: Minecraft Launcher
REM  Copyrights: IIIypuk
REM  Trademarks: 
REM  Originalname: mc_start.exe
REM  Comments: Script for launch Minecraft without official Mojang launcher
REM  Productversion:  1. 0. 0. 0
REM  Fileversion:  1. 1. 0. 0
REM  Internalname: 
REM  Appicon: minecraft.ico
REM  AdministratorManifest: No
REM  QBFC Project Options End
ECHO ON
::
@echo off
cd \

:: main directory of the game
set MC_DIR="C:\IIIypuk\Minecraft"
:: look README.md file
set NATIVES_DIR="%MC_DIR%\natives\1.7.2"
:: Are stored here...
:: saves/, resourcepacks/ and screenshots/ dirs
:: and options.txt and servers.dat files
set GAME_DIR="%MC_DIR%\profile"
:: libraries and resource dir (requires no changes)
set ASSETS_DIR="%MC_DIR%\assets"

set PLAYER="IIIypuk"   :: player nickname (the over head)
set VERSION="1.7.2" :: version minecraft (from versions/ dir)


:: running minecraft
cd %MC_DIR%

java -Xmx512M -Djava.library.path=%NATIVES_DIR% -cp "%MC_DIR%\libraries\org\apache\logging\log4j\log4j-api\2.0-beta9\log4j-api-2.0-beta9.jar;%MC_DIR%\libraries\org\apache\logging\log4j\log4j-core\2.0-beta9\log4j-core-2.0-beta9.jar;%MC_DIR%\libraries\com\ibm\icu\icu4j-core-mojang\51.2\icu4j-core-mojang-51.2.jar;%MC_DIR%\libraries\com\mojang\authlib\1.3\authlib-1.3.jar;%MC_DIR%\libraries\io\netty\netty-all\4.0.10.Final\netty-all-4.0.10.Final.jar;%MC_DIR%\libraries\java3d\vecmath\1.3.1\vecmath-1.3.1.jar;%MC_DIR%\libraries\net\sf\trove4j\trove4j\3.0.3\trove4j-3.0.3.jar;%MC_DIR%\libraries\net\sf\jopt-simple\jopt-simple\4.5\jopt-simple-4.5.jar;%MC_DIR%\libraries\com\paulscode\codecjorbis\20101023\codecjorbis-20101023.jar;%MC_DIR%\libraries\com\paulscode\codecwav\20101023\codecwav-20101023.jar;%MC_DIR%\libraries\com\paulscode\librarylwjglopenal\20100824\librarylwjglopenal-20100824.jar;%MC_DIR%\libraries\com\paulscode\libraryjavasound\20101123\libraryjavasound-20101123.jar;%MC_DIR%\libraries\com\paulscode\soundsystem\20120107\soundsystem-20120107.jar;%MC_DIR%\libraries\com\google\guava\guava\15.0\guava-15.0.jar;%MC_DIR%\libraries\org\apache\commons\commons-lang3\3.1\commons-lang3-3.1.jar;%MC_DIR%\libraries\commons-io\commons-io\2.4\commons-io-2.4.jar;%MC_DIR%\libraries\net\java\jinput\jinput\2.0.5\jinput-2.0.5.jar;%MC_DIR%\libraries\net\java\jinput\jinput-platform\2.0.5\jinput-platform-2.0.5-natives-windows.jar;%MC_DIR%\libraries\net\java\jutils\jutils\1.0.0\jutils-1.0.0.jar;%MC_DIR%\libraries\com\google\code\gson\gson\2.2.4\gson-2.2.4.jar;%MC_DIR%\libraries\org\lwjgl\lwjgl\lwjgl\2.9.0\lwjgl-2.9.0.jar;%MC_DIR%\libraries\org\lwjgl\lwjgl\lwjgl_util\2.9.0\lwjgl_util-2.9.0.jar;%MC_DIR%\versions\1.7.2\1.7.2.jar" net.minecraft.client.main.Main --username %PLAYER% --version %VERSION% --gameDir %GAME_DIR% --assetsDir %ASSETS_DIR% --accessToken 0

