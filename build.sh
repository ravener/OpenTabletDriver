#!/bin/bash

# Simple bash script to easily build on linux to verify functionality.
# Uses the same commands as those found in the PKGBUILD for the AUR
# package.

echo "Building OpenTabletDriver. Projects may need restoration..."
mkdir ./bin

echo "\nBuilding Daemon...\n"
dotnet publish OpenTabletDriver.Daemon     \
  --configuration   Release                \
  --framework       net5                   \
  --runtime         linux-x64              \
  --self-contained  false                  \
  --output          "./bin"                \
  /p:SuppressNETCoreSdkPreviewMessage=true \
  /p:PublishTrimmed=false

echo "\nBuilding Console...\n"
dotnet publish OpenTabletDriver.Console    \
  --configuration   Release                \
  --framework       net5                   \
  --runtime         linux-x64              \
  --self-contained  false                  \
  --output          "./bin"                \
  /p:SuppressNETCoreSdkPreviewMessage=true \
  /p:PublishTrimmed=false

echo "\nBuilding GTK UX...\n"
dotnet publish OpenTabletDriver.UX.Gtk     \
  --configuration   Release                \
  --framework       net5                   \
  --runtime         linux-x64              \
  --self-contained  false                  \
  --output          "./bin"                \
  /p:SuppressNETCoreSdkPreviewMessage=true \
  /p:PublishTrimmed=false

echo "Build finished. Binaries created in './bin'"
