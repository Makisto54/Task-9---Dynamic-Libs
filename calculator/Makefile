CC := gcc
LIBS := mylib

DEBUG := 
CFLAGS := -c -fPIC
LIBFLAGS := -shared -o

BIN_DIR := bin
SRC_DIR := src
OBJ_DIR := build
HDR_DIR := headers

BIN := calculator
OBJ := add.o $(OBJ_DIR)/sub.o $(OBJ_DIR)/mul.o $(OBJ_DIR)/div.o 
SRC := add.c $(SRC_DIR)/sub.c $(SRC_DIR)/mul.c $(SRC_DIR)/div.c

LDFLAGS := -L$(BIN_DIR)/ -l 

.PHONY: all debug create_dir clean

all: create_dir $(BIN_DIR)/$(BIN)

create_dir:
	mkdir $(BIN_DIR)
	mkdir $(OBJ_DIR)

debug: DEBUG += -g 
debug: all

$(BIN_DIR)/$(BIN): $(LIBS) $(SRC_DIR)/$(BIN).c $(HDR_DIR)/functions.h
	$(CC) $(DEBUG) $(SRC_DIR)/$(BIN).c -o $(BIN_DIR)/$(BIN) $(LDFLAGS)$(LIBS)

$(LIBS): $(OBJ_DIR)/$(OBJ)
	$(CC) $(LIBFLAGS) $(BIN_DIR)/lib$(LIBS).so $(OBJ_DIR)/$(OBJ)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) $(DEBUG) $< -o $@

clean:
	rm -rf $(BIN_DIR) $(OBJ_DIR)
