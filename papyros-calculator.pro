QT += quick qml
QT += widgets

SOURCES += main.cpp

OTHER_FILES = README.md

RESOURCES += papyros-calculator.qrc
 
CONFIG += staticlib

target.path = /usr/bin

desktop.files = papyros-calculator.desktop
desktop.path = /usr/share/applications

INSTALLS += target desktop


RC_ICONS = papyros-calculator.ico