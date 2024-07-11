!versionAtLeast(QT_VERSION, 5.15.0):error("Requires Qt version 5.15.0 or greater.")

TEMPLATE +=app
TARGET = \\\"$$cat(activity_name.txt)\\\"

QT       += core qml quick quickcontrols2 multimedia svg

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets
CONFIG += bump_version
CONFIG += c++17
CONFIG += resources_big
CONFIG(release,debug|release):CONFIG += qtquickcompiler # Qt Quick compiler
CONFIG(release,debug|release):CONFIG += add_source_task # Add source.zip to target
CONFIG(debug,debug|release):CONFIG += qml_debug  # Add qml_debug

DEFINES += VERSION_STR=\\\"$$cat(version.txt)\\\"
DEFINES += PACKAGE_NAME_STR=\\\"$$cat(package_name.txt)\\\"
DEFINES += ACTIVITY_NAME_STR=\\\"$$cat(activity_name.txt)\\\"

DEFINES += QT_DEPRECATED_WARNINGS

# QT_NO_CAST_FROM_ASCII QT_NO_CAST_TO_ASCII
#don't use precompiled headers https://www.kdab.com/beware-of-qt-module-wide-includes/

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

HEADERS += \
        src/hal.h 

SOURCES += \
            src/main.cpp \
            src/hal.cpp 

RESOURCES += \
        images.qrc \
        qml.qrc \
        fonts.qrc \
        js.qrc
# Additional import path used to resolve QML modules just for Qt Quick Designer
QML_DESIGNER_IMPORT_PATH = $$PWD/res/qml

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH = $$PWD/res/qml
QML2_IMPORT_PATH = $$PWD/res/qml

add_source_task{
#https://raymii.org/s/blog/Existing_GPL_software_for_sale.html
    message("add source.zip")
    #system(cd $$PWD; cd ../;rm source.zip; zip -r source.zip .)
    #RESOURCES += source.qrc
}

bump_version{
    message("Bump or update App version")
    #system($$PWD/tools/ci/bump_ver.sh)
}

DISTFILES += \
    README.md \
    activity_name.txt \
    package_name.txt \
    version.txt


