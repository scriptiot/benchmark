TEMPLATE = app
TARGET = ejs
VERSION = 1.0
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

CONFIG(release, release|debug) {
    QMAKE_CFLAGS += -O2 -std=c99  -ffunction-sections -fdata-sections  -fno-asynchronous-unwind-tables -Wl,--gc-sections -Wl,--strip-all
    QMAKE_LFLAGS += -Wl,--gc-sections -Wl,--strip-all
} else {
    QMAKE_CFLAGS += -ffunction-sections -fdata-sections
    QMAKE_LFLAGS += -Wl,--gc-sections
}

DEFINES += QMAKE_TARGET=\\\"$$TARGET\\\" QMAKE_VERSION=\\\"$$VERSION\\\"
DEFINES += EVM_LANG_ENABLE_JAVASCRIPT
DEFINES += EVM_LANG_ENABLE_REPL
DEFINES += CONFIG_EVM_ECMA_OBJECT
DEFINES += CONFIG_EVM_ECMA_ARRAY
DEFINES += CONFIG_EVM_ECMA_NUMBER
DEFINES += CONFIG_EVM_ECMA_STRING
DEFINES += CONFIG_EVM_ECMA_MATH

INCLUDEPATH += $$PWD/../../include

include($$PWD/../../ecma/ecma.pri)
LIBS += $$PWD/../../lib/x86-linux/libejs.a

exists($$PWD/../main.c) {
    SOURCES += \
        ../main.c
}

exists($$PWD/main.c) {
    SOURCES += \
        main.c
}
