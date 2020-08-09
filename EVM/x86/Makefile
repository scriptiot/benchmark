CC			=gcc
DEFINES     = -DEVM_LANG_ENABLE_JAVASCRIPT -DEVM_LANG_ENABLE_REPL -DCONFIG_EVM_ECMA_OBJECT -DCONFIG_EVM_ECMA_ARRAY -DCONFIG_EVM_ECMA_NUMBER -DCONFIG_EVM_ECMA_STRING -DCONFIG_EVM_ECMA_MATH
CFLAGS      = -pipe -ffunction-sections -fdata-sections -g -Wall -W -fPIC $(DEFINES)
INCLUDES  	+=-I../../include
LIB_NAMES 	=-lejs -lm
LIB_PATH 	=-L../../lib/x86-linux
OBJ			=$(patsubst %.c, %.o, $(SOURCES))
TARGET		=ejs

DEST_DIR	=../../build/evm/x86-linux

SOURCES       = ../../ecma/ecma_object.c \
		../../ecma/ecma_array.c \
		../../ecma/ecma_math.c \
		../../ecma/ecma_regexp.c \
		../../ecma/re.c \
		../../ecma/ecma.c \
		../../ecma/ecma_number.c \
		../../ecma/ecma_string.c \
		../../EVM/x86/main.c

#links
$(TARGET):$(OBJ)
	@mkdir -p $(DEST_DIR)
	$(CC) $(OBJ) $(LIB_PATH) $(LIB_NAMES) -o $(DEST_DIR)/$(TARGET)
	@rm -rf $(OBJ)
	
#compile
%.o: %.c
	$(CC) $(INCLUDES) $(DEFINES) -c $(CFLAGS) $< -o $@

.PHONY:clean
clean:
	@echo "Remove linked and compiled files......"
	rm -rf $(OBJ) $(TARGET) $(DEST_DIR) 