PWD			=$(shell pwd)
OS			=$(shell uname -s)
LINUX		=Linux
CC			=gcc
DEFINES     = -DEVM_LANG_ENABLE_JAVASCRIPT -DEVM_LANG_ENABLE_REPL -DCONFIG_EVM_ECMA_OBJECT -DCONFIG_EVM_ECMA_ARRAY -DCONFIG_EVM_ECMA_NUMBER -DCONFIG_EVM_ECMA_STRING -DCONFIG_EVM_ECMA_MATH
CFLAGS      = -pipe -ffunction-sections -fdata-sections -g -Wall -W -fPIC -Wl,--strip-all $(DEFINES)
INCLUDES  	+=-I./include
LIB_NAMES 	=-lejs -lm

ifeq ($(OS), $(LINUX))
LIB_PATH 	=-L./../../lib/x86_64_linux_gnu
else
LIB_PATH 	=-L./../../lib/x86_64_windows_mingw
endif

OBJ			=$(patsubst %.c, %.o, $(SOURCES))
TARGET		=ejs

ifeq ($(OS), $(LINUX))
DEST_DIR	=./../../bin/x86_64_linux_gnu
else
DEST_DIR	=./../../bin/x86_64_windows_mingw
endif

SOURCES       = ./ecma/ecma_object.c \
		./ecma/ecma_array.c \
		./ecma/ecma_math.c \
		./ecma/ecma_regexp.c \
		./ecma/re.c \
		./ecma/ecma.c \
		./ecma/ecma_number.c \
		./ecma/ecma_string.c \
		main.c

#links
$(TARGET): $(OBJ)
	@mkdir -p $(DEST_DIR)
	$(CC) $(OBJ) $(LIB_PATH) $(LIB_NAMES) -o $(DEST_DIR)/$(TARGET)
	@rm -rf $(OBJ)
	
#compile
%.o: %.c
	$(CC) $(INCLUDES) -c $(CFLAGS) $< -o $@


clean:
	@echo $(LIB_PATH)
	@echo "Remove linked and compiled files......"
	rm -rf $(OBJ) $(TARGET) $(DEST_DIR) 

.PHONY:clean ejs