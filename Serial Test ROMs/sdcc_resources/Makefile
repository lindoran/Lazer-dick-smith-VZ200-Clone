# ---------- Config ----------
SRC_DIR      := src
INC_DIR      := include
BUILD_DIR    := build
BIN_DIR      := bin

CC           := sdcc -mz80
AS           := sdasz80
SREC_CAT     := srec_cat

CODE_LOC     := 0x7863
DATA_LOC     := 0x8000

PROGRAMS     := loopback test hello
COMMON_OBJS  := rom.rel
CRT0_REL     := crt0.rel

# ---------- High-Level Targets ----------
.PHONY: all clean $(PROGRAMS)

all: $(PROGRAMS)

$(PROGRAMS): %: $(BIN_DIR)/%.ihx $(BIN_DIR)/%.bin $(BIN_DIR)/%.dump

# ---------- Build Rules ----------
$(BUILD_DIR)/%.rel: $(SRC_DIR)/%.c | $(BUILD_DIR)
	$(CC) -I$(INC_DIR) -c $< -o $@

$(BUILD_DIR)/%.rel: $(SRC_DIR)/%.s | $(BUILD_DIR)
	$(AS) -o $@ $<

$(BIN_DIR)/%.ihx: $(BUILD_DIR)/$(CRT0_REL) $(BUILD_DIR)/%.rel $(addprefix $(BUILD_DIR)/,$(COMMON_OBJS)) | $(BIN_DIR)
	$(CC) --no-std-crt0 --code-loc $(CODE_LOC) --data-loc $(DATA_LOC) $^ -o $@

$(BIN_DIR)/%.bin: $(BIN_DIR)/%.ihx | $(BIN_DIR)
	$(SREC_CAT) $< -Intel -fill 0x00 0x0000 0xFFFF -o $@ -Binary

$(BIN_DIR)/%.dump: $(BIN_DIR)/%.bin
	xxd $< > $@

# ---------- Directory Setup ----------
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

$(BIN_DIR):
	mkdir -p $(BIN_DIR)

clean:
	rm -rf $(BUILD_DIR) $(BIN_DIR)
