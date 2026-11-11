QT += core gui concurrent widgets printsupport qml quick quickcontrols2 quickdialogs2

win32: QT += svg

CONFIG += c++17 release
TARGET = omawrite
TEMPLATE = app

win32: VERSION = 0.7.2
QMAKE_TARGET_PRODUCT = Omawrite
QMAKE_TARGET_DESCRIPTION = Omawrite Markdown editor
QMAKE_TARGET_COPYRIGHT = Copyright (c) Omacom

HEADERS += \
    src/backend.h \
    src/cli.h \
    src/markdownhighlighter.h

SOURCES += \
    src/main.cpp \
    src/backend.cpp \
    src/cli.cpp \
    src/markdownhighlighter.cpp

RESOURCES += src/resources.qrc

win32: RC_ICONS = windows/omawrite.ico
