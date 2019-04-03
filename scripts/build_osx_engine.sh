#!/bin/bash

. scripts/lib.sh

# Build engine

cd $TRAVIS_BUILD_DIR
python waf configure --sdl2=$HOME/Library/Frameworks/SDL2.framework/ --vgui=$TRAVIS_BUILD_DIR/vgui-dev --build-type=debug || die
python waf build || die
mkdir -p pkg/
cp build/engine/libxash.dylib build/game_launch/xash3d build/mainui/libmenu.dylib build/vgui_support/libvgui_support.dylib vgui-dev/lib/vgui.dylib pkg/
cp ~/Library/Frameworks/SDL2.framework/SDL2 pkg/libSDL2.dylib
tar -cjf $TRAVIS_BUILD_DIR/xash3d-osx.tar.bz2 pkg/*
