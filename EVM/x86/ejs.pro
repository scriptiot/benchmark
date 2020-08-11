TEMPLATE = app
TARGET = ejs
VERSION = 1.0
CONFIG += console
CONFIG -= app_bundle
CONFIG -= qt

CONFIG(release, release|debug) {
    QMAKE_CFLAGS += -O3 -std=c99  -ffunction-sections -fdata-sections  -fno-asynchronous-unwind-tables -Wl,--gc-sections -Wl,--strip-all
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

exists($$PWD/../main.c) {
    SOURCES += \
        ../main.c
}

exists($$PWD/main.c) {
    SOURCES += \
        main.c
}

SOURCES += \
    ../../../evm/libevm/compiler.c \
    ../../../evm/libevm/evm.c \
    ../../../evm/libevm/executable.c \
    ../../../evm/libevm/gc.c \
    ../../../evm/libevm/jsparser.c \
    ../../../evm/libevm/native.c \
    ../../../evm/libevm/pyparser.c \
    ../../../evm/libevm/qmlparser.c \
    ../../../evm/libevm/xmlparser.c \
    ../../../evm/native/repl/evm_repl_history.c \
    ../../../evm/native/repl/evm_repl.c \
    ../../../evm/native/repl/rbuff.c

HEADERS += \
    ../../../evm/native/repl/evm_repl_history.h \
    ../../../evm/native/repl/evm_repl.h \
    ../../../evm/native/repl/rbuff.h \
    ../../include/evm_type.h \
    ../../include/evm.h

DISTFILES +=
