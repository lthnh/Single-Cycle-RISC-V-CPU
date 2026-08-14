PROJECT_NAME := single-cycle-risc-v-cpu
PROJECT_DIR = $(shell find $$HOME -name $(PROJECT_NAME) -type d 2>/dev/null)

vpath %.v $(PROJECT_DIR)/src $(PROJECT_DIR)/src/alu_mods $(PROJECT_DIR)/src/alu_mods/add_mods/cla_mod $(PROJECT_DIR)/src/alu_mods/add_mods/rca_mod

TARGET_PATH := $(PROJECT_DIR)/tests/bin

FLAGS := -I$(PROJECT_DIR)/inc

all: half_adder_tb full_adder_tb

half_adder_tb: half_adder_tb.v half_adder.v
	iverilog $(FLAGS) -o $(TARGET_PATH)/$@ $^
	vvp $(TARGET_PATH)/$@

full_adder_tb: full_adder_tb.v full_adder.v half_adder.v
	iverilog $(FLAGS) -o $(TARGET_PATH)/$@ $^
	vvp $(TARGET_PATH)/$@

.SILENT: all half_adder_tb full_adder_tb
