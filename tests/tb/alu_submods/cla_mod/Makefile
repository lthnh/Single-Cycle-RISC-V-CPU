PROJECT_NAME := single-cycle-risc-v-cpu
PROJECT_DIR = $(shell find $$HOME -name $(PROJECT_NAME) -type d 2>/dev/null)

vpath %.v $(PROJECT_DIR)/src $(PROJECT_DIR)/src/alu_submods $(PROJECT_DIR)/src/alu_submods/cla_mod $(PROJECT_DIR)/src/alu_submods/rca_mod

TARGET_PATH := $(PROJECT_DIR)/tests/bin

FLAGS := -I$(PROJECT_DIR)/inc

all: four_bit_cla_tb modified_full_adder_tb four_bit_lookahead_tb

four_bit_cla_tb: four_bit_cla_tb.v four_bit_cla.v four_bit_lookahead.v modified_full_adder.v
	iverilog $(FLAGS) -o $(TARGET_PATH)/$@ $^
	vvp $(TARGET_PATH)/$@

modified_full_adder_tb: modified_full_adder_tb.v modified_full_adder.v
	iverilog $(FLAGS) -o $(TARGET_PATH)/$@ $^
	vvp $(TARGET_PATH)/$@

four_bit_lookahead_tb: four_bit_lookahead_tb.v four_bit_lookahead.v
	iverilog $(FLAGS) -o $(TARGET_PATH)/$@ $^
	vvp $(TARGET_PATH)/$@

.SILENT: all four_bit_cla_tb modified_full_adder_tb four_bit_lookahead_tb
