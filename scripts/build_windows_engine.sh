#!/bin/bash

. scripts/lib.sh

# Build engine
cd $TRAVIS_BUILD_DIR
./waf.bat configure --sdl2=$TRAVIS_BUILD_DIR/SDL2_VC --vgui=$TRAVIS_BUILD_DIR/vgui-dev --build-type=debug
./waf.bat build
echo After build

cp $TRAVIS_BUILD_DIR/SDL2_VC/lib/x86/SDL2.dll . # Install SDL2
cp build/vgui_support/vgui_support.dll .
cp vgui-dev/lib/win32_vc6/vgui.dll .
cp build/engine/xash.dll .
cp build/mainui/menu.dll .
cp build/ref_gl/ref_gl.dll .
cp build/ref_soft/ref_soft.dll .
cp build/game_launch/xash3d.exe .

7z a -t7z $TRAVIS_BUILD_DIR/xash3d-vc.7z -m0=lzma2 -mx=9 -mfb=64 -md=32m -ms=on *.dll *.exe
