MAKEFLAGS += --no-print-directory

PROJECT_NAME := single-cycle-risc-v-cpu
PROJECT_DIR = $(shell find $$HOME -name $(PROJECT_NAME) -type d 2>/dev/null)

TEST_DIR := $(shell find $(PROJECT_DIR)/tests -name Makefile -type f -execdir pwd \; 2>/dev/null)

test: $(TEST_DIR)
$(TEST_DIR):
	$(MAKE) -C $@

.PHONY: test $(TEST_DIR)

.SILENT: test $(TEST_DIR)
