# Copyright (C) 2015 Nicolas Lamirault <nicolas.lamirault@gmail.com>

# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

APP="muk"

SHELL = /bin/bash

NO_COLOR=\033[0m
OK_COLOR=\033[32;01m
ERROR_COLOR=\033[31;01m
WARN_COLOR=\033[33;01m

VERSION="0.1.0"

OUTPUT = /mnt/muk

all: help

help:
	@echo -e "$(OK_COLOR)==== $(APP) [$(VERSION)] ====$(NO_COLOR)"
	@echo -e "$(WARN_COLOR)iso $(NO_COLOR)             : Download isos"
	@echo -e "$(WARN_COLOR)run iso=<file> $(NO_COLOR)  : Run iso using QEMU"
	@echo -e "$(WARN_COLOR)init fs=<sdbX>$(NO_COLOR)   : Create a FAT32-formatted USB disk"
	@echo -e "$(WARN_COLOR)build fs=<sdbX> $(NO_COLOR) : Build the USB key"
	@echo -e "$(WARN_COLOR)clean           $(NO_COLOR) : Clean environment"

.PHONY: iso
iso:
	@bin/download.sh

.PHONY: run
run:
	qemu-system-x86_64 -m 1024 -boot c -net nic -net user -localtime -cdrom $(iso)

.PHONY: init
init:
	@sudo mkfs.vfat -F 32 -n muk -I /dev/$(fs)
#	@sudo mkfs.ext4 -n muk -I /dev/$(fs)

# .PHONY: build
# build:
# 	@sudo bin/build.sh $(fs)
