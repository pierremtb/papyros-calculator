QT += quick qml
QT += widgets

SOURCES += main.cpp

OTHER_FILES = README.md

RESOURCES += papyros-calculator.qrc


target.path = /usr/bin

desktop.files = papyros-calculator.desktop
desktop.path = /usr/share/applications

INSTALLS += target desktop


