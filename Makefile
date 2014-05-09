########################################################################
# !makefile
# Writed by chenzilin
# Email: chenzilin115@gmail.com
########################################################################
MAKEFILE = Makefile

########################################################################
# define variable
########################################################################
CC = gcc
MOVE = mv -f
DEL_DIR = rm -rf
DEL_FILE = rm -f
MKDIR = mkdir -p
SYMLINK = ln -f -s
COPY_FILE = cp -f
COPY_DIR = cp -f -R
CHMOD = chmod 755
CHOWN = chown root:root
CHK_DIR_EXISTS= test -d
INSTALL_DIR = $(COPY_DIR)
INSTALL_FILE = install -m 644 -p
INSTALL_PROGRAM = install -m 755 -p

SRC_DIR = src
BIN_DIR = bin
BUILD_DIR = build

TARGET = dnw2
TARGET_DIR = /usr/bin

########################################################################
# target
########################################################################
$(BIN_DIR)/$(TARGET) : $(BUILD_DIR)/$(TARGET).o
	$(CC) -o $(BIN_DIR)/$(TARGET)  $(BUILD_DIR)/$(TARGET).o  -lusb
$(BUILD_DIR)/$(TARGET).o : $(SRC_DIR)/$(TARGET).c
	$(CC) -c -o $(BUILD_DIR)/$(TARGET).o  $(SRC_DIR)/$(TARGET).c

########################################################################
# install
########################################################################
.PHONY : install
install :
	$(COPY_FILE) $(BIN_DIR)/$(TARGET) $(TARGET_DIR)/$(TARGET)
	$(CHOWN) $(TARGET_DIR)/$(TARGET)
	$(CHMOD) $(TARGET_DIR)/$(TARGET)

########################################################################
# uninstall
########################################################################
.PHONY : uninstall
uninstall :
	$(DEL_FILE) $(TARGET_DIR)/$(TARGET)

########################################################################
# clean
########################################################################
.PHONY : clean
clean :
	$(DEL_FILE) *~
	$(DEL_FILE) $(SRC_DIR)/*~
	$(DEL_FILE) $(BIN_DIR)/*～  $(BUILD_DIR)/*

########################################################################
# distclean
########################################################################
.PHONY : distclean
distclean :
	$(DEL_FILE) *~
	$(DEL_FILE) $(SRC_DIR)/*~
	$(DEL_FILE) $(BIN_DIR)/*  $(BUILD_DIR)/*