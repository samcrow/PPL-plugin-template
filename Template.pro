
# To the extent possible under law, the author has waived all
# copyright and related or neighboring rights to this work.

# Build a dynamic library without Qt
TEMPLATE = lib
QT -= gui core

CONFIG += warn_on plugin debug c++11
CONFIG -= thread exceptions qt rtti

VERSION = 1.0.0

# These paths can be changed to match the location of the XPLM headers
INCLUDEPATH += ../SDK/CHeaders/XPLM
INCLUDEPATH += ../SDK/CHeaders/Wrappers
INCLUDEPATH += ../SDK/CHeaders/Widgets

# Specify the plugin class name
# The plugin interface code uses this to initialize the correct plugin class.
DEFINES += PLUGIN_CLASS_NAME=TemplatePlugin
# Specify the plugin header file name
DEFINES += PLUGIN_HEADER_NAME=templateplugin.h

# Use SDK 2.0: No backward compatibility before X-Plane 9.0
DEFINES += XPLM200
# Use SDK 2.1: No backward compatibility before X-Plane 10.0
DEFINES += XPLM210

win32 {
    DEFINES += APL=0 IBM=1 LIN=0
    LIBS += -L../SDK/Libraries/Win
    LIBS += -lXPLM -lXPWidgets
    TARGET = win.xpl
}

unix:!macx {
    DEFINES += APL=0 IBM=0 LIN=1
    TARGET = lin.xpl
    QMAKE_CXXFLAGS += -fvisibility=hidden
}

macx {
    DEFINES += APL=1 IBM=0 LIN=0
    TARGET = mac.xpl
    QMAKE_LFLAGS += -flat_namespace -undefined suppress

    # Architectures to build
    CONFIG += x86 # ppc

	QMAKE_MAC_SDK = macosx
}

SOURCES += \
    plugin-interface/plugin.cpp \
    plugin-interface/plugin_main.cpp \
    templateplugin.cpp

HEADERS += \
    plugin-interface/plugin.h \
    templateplugin.h
