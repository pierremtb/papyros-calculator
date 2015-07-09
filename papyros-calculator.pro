QT += quick qml
QT += widgets

SOURCES += src/main.cpp

OTHER_FILES = README.md

RESOURCES += src/papyros-calculator.qrc

CONFIG += staticlib

target.path = /usr/bin

desktop.files = papyros-calculator.desktop
desktop.path = /usr/share/applications

INSTALLS += target desktop


RC_ICONS = other/papyros-calculator.ico
