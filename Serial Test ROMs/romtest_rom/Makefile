# ---------- Config ----------
SRC_DIR      := src
INC_DIR      := include
BUILD_DIR    := build
BIN_DIR      := bin

CC           := sdcc -mz80
AS           := sdasz80
SREC_CAT     := srec_cat
DUMP_TOOL    := xxd

CODE_LOC     := 0x1003
DATA_LOC     := 0x1500

TARGET_BASE  := romtest
IHX_FILE     := $(BIN_DIR)/$(TARGET_BASE).ihx

# ---------- Monitor ROM ----------
MONZ80_DIR   := ../modules/monz80-updates
MONZ80_SRC   := $(MONZ80_DIR)/monz80.z80
MONZ80_HEX   := $(MONZ80_DIR)/monz80.hex

# ---------- Outputs ----------
MERGED_HEX   := $(BIN_DIR)/combined.hex
MERGED_BIN   := $(BIN_DIR)/combined.rom
MERGED_DUMP  := $(BIN_DIR)/combined.dump

# ---------- Source Files ----------
C_SRCS := $(wildcard $(SRC_DIR)/*.c)
S_SRCS := $(wildcard $(SRC_DIR)/*.s)
OBJS   := $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.rel,$(C_SRCS)) \
          $(patsubst $(SRC_DIR)/%.s,$(BUILD_DIR)/%.rel,$(S_SRCS))

# ---------- High-Level Targets ----------
.PHONY: all clean

all: $(MERGED_BIN) $(MERGED_DUMP)

# ---------- Compilation ----------
$(BUILD_DIR)/%.rel: $(SRC_DIR)/%.c | $(BUILD_DIR)
	$(CC) --no-std-crt0 --code-loc $(CODE_LOC) --data-loc $(DATA_LOC) -I$(INC_DIR) -c $< -o $@

$(BUILD_DIR)/%.rel: $(SRC_DIR)/%.s | $(BUILD_DIR)
	$(AS) -o $@ $<

$(IHX_FILE): $(OBJS) | $(BIN_DIR)
	$(CC) --no-std-crt0 --code-loc $(CODE_LOC) --data-loc $(DATA_LOC) -I$(INC_DIR) $^ -o $@

# ---------- Monitor Build ----------
$(MONZ80_HEX): $(MONZ80_SRC)
	$(MAKE) -C $(MONZ80_DIR)

# ---------- Merge ROMs ----------
$(MERGED_HEX): $(MONZ80_HEX) $(IHX_FILE)
	$(SREC_CAT) $(MONZ80_HEX) -intel \
				$(IHX_FILE)   -intel -crop 0x1000 0xFFFF \
				-o $@ -intel

$(MERGED_BIN): $(MERGED_HEX)
	$(SREC_CAT) $< -intel -o $@ -binary

$(MERGED_DUMP): $(MERGED_BIN)
	$(DUMP_TOOL) $< > $@

# ---------- Directory Setup ----------
$(BUILD_DIR):
	mkdir -p $@

$(BIN_DIR):
	mkdir -p $@

clean:
	rm -rf $(BUILD_DIR) $(BIN_DIR)
	cd ../modules/monz80-updates && $(MAKE) clean
