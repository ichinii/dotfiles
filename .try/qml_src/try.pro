QT += quick
CONFIG += c++17
DEFINES += QT_DEPRECATED_WARNINGS
INCLUDEPATH += .
QML_IMPORT_PATH =
QML_DESIGNER_IMPORT_PATH =
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target

SOURCES += \
  main.cpp

HEADERS += \

RESOURCES += \
  qml.qrc
