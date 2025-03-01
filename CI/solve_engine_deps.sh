#!/bin/bash

###### Harness #######
if [ "$TEST_HARNESS" == true ]; then
  LINUX_DEPS="$LINUX_DEPS openbox libgtest-dev wmctrl xdotool lcov x11-utils"
  WINDOWS_DEPS="$WINDOWS_DEPS git make rsync mingw-w64-x86_64-toolchain mingw-w64-x86_64-boost mingw-w64-x86_64-pugixml\
  mingw-w64-x86_64-rapidjson mingw-w64-x86_64-yaml-cpp mingw-w64-x86_64-grpc mingw-w64-x86_64-protobuf mingw-w64-x86_64-glm\
  mingw-w64-x86_64-libpng mingw-w64-x86_64-re2 mingw-w64-x86_64-box2d mingw-w64-x86_64-libffi mingw-w64-x86_64-glew\
  mingw-w64-x86_64-openal mingw-w64-x86_64-dumb mingw-w64-x86_64-alure mingw-w64-x86_64-libmodplug mingw-w64-x86_64-libvorbis\
  mingw-w64-x86_64-libogg mingw-w64-x86_64-flac mingw-w64-x86_64-mpg123 mingw-w64-x86_64-libsndfile mingw-w64-x86_64-libgme\
  mingw-w64-x86_64-SDL2 mingw-w64-x86_64-SDL2_mixer mingw-w64-x86_64-libepoxy mingw-w64-x86_64-gtest lcov mingw-w64-x86_64-mesa mingw-w64-x86_64-imagemagick mingw-w64-x86_64-jq"
fi

###### Compilers #######
if [ "$COMPILER" == "gcc32" ] || [ "$COMPILER" == "clang32" ]; then
  LINUX_DEPS="$LINUX_DEPS libc6:i386 libc++-dev:i386 libstdc++6:i386\
    libncurses5:i386 libx11-6:i386 libglew-dev:i386 libglu1-mesa-dev:i386\
    libgl1-mesa-dev:i386 lib32z1-dev libxrandr-dev:i386 libxinerama-dev:i386\
    gcc-multilib g++-multilib libc++abi-dev:i386 libpng-dev:i386 libffi-dev:i386"
elif [ "$COMPILER" == "MinGW64" ] || [ "$COMPILER" == "MinGW32" ]; then
  LINUX_DEPS="$LINUX_DEPS mingw-w64 wine64 wine32 wine-stable libgl1-mesa-glx:i386"
fi

###### Platforms #######
if [ "$PLATFORM" == "SDL" ] || [ "$TEST_HARNESS" == true ]; then
  LINUX_DEPS="$LINUX_DEPS libsdl2-dev libdrm-dev libgbm-dev"
fi

###### Graphics #######
LINUX_DEPS="$LINUX_DEPS libepoxy-dev libegl1-mesa-dev libgles2-mesa-dev libglew-dev libxrandr-dev libxinerama-dev"

###### Audio #######
if [ "$AUDIO" == "OpenAL" ] || [ "$TEST_HARNESS" == true ]; then
  LINUX_DEPS="$LINUX_DEPS libalure-dev libvorbisfile3 libvorbis-dev libdumb1-dev"
fi

###### Widgets #######
if [ "$WIDGETS" == "GTK+" ] || [ "$TEST_HARNESS" == true ]; then
  LINUX_DEPS="$LINUX_DEPS libgtk2.0-dev"
fi
if [ "$WIDGETS" == "xlib" ] || [ "$TEST_HARNESS" == true ]; then
  LINUX_DEPS="$LINUX_DEPS zenity kdialog libprocps-dev"
fi

###### Extensions #######
if [[ "$EXTENSIONS" =~ "GME" ]] || [ "$TEST_HARNESS" == true ]; then
  LINUX_DEPS="$LINUX_DEPS libgme-dev"
fi

if [[ "$EXTENSIONS" =~ "Box2DPhysics" ]] || [[ "$EXTENSIONS" =~ "StudioPhysics" ]] || [ "$TEST_HARNESS" == true ]; then
  LINUX_DEPS="$LINUX_DEPS libbox2d-dev"
fi

if [[ "$EXTENSIONS" =~ "BulletDynamics" ]] || [ "$TEST_HARNESS" == true ]; then
  LINUX_DEPS="$LINUX_DEPS libbullet-dev"
fi

if [[ "$EXTENSIONS" =~ "ttf" ]] || [ "$TEST_HARNESS" == true ]; then
  LINUX_DEPS="$LINUX_DEPS libfreetype6-dev"
fi

if [[ "$EXTENSIONS" =~ "ExternalFuncs" ]]; then
  LINUX_DEPS="$LINUX_DEPS libffi-dev"
fi

if [ "$TRAVIS_OS_NAME" == "linux" ]; then
  echo "$LINUX_DEPS"
elif [ "$TRAVIS_OS_NAME" == "osx" ]; then
  echo "$OSX_DEPS"
elif [ "$TRAVIS_OS_NAME" == "windows" ]; then
  echo "$WINDOWS_DEPS"
fi
