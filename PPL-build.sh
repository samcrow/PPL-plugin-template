#!/bin/sh

# Configures and compiles the PPL library

mkdir -p PPL-build
cd PPL-build

# Configure PPL
CONFIG=''

# Uncomment to enable PNG image loading support
#CONFIG+=$CONFIG' CONFIG+=withpng'

# Uncomment to enable OpenGL text rendering
#CONFIG+=$CONFIG' CONFIG+=withfreetype'

# Uncomment to build in debug mode
CONFIG=$CONFIG' CONFIG+=debug'

# qmake
qmake ../PPL/PPL.pro PRIVATENAMESPACE=Template $CONFIG INCLUDEPATH+=../../SDK/CHeaders/XPLM INCLUDEPATH+=../../SDK/CHeaders/Widgets INCLUDEPATH+=../../SDK/CHeaders/Wrappers

make

cd ..
