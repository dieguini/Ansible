SHELL := /bin/bash

all: config bash
.PHONY: all

# Local
.PHONY: config
config:
	@git config --global --add safe.directory '*'

.PHONY: bash
bash:
	@echo "=========== [BASH PROFILE] ==========="
	echo '' >> ~/.bashrc
	echo '# MY BASH PROFILE' >> ~/.bashrc
	echo "alias m='make'" >> ~/.bashrc
	source ~/.bashrc

.DEFAULT_GOAL := all

# Extras
.PHONY: copy_djauregui_mount
	@echo "=========== [COPYING DJAUREGUI MOUNT] ==========="
	scp -r /mnt/d/Users/DSalvatierra/Documents/LocalRepositories/AxosAnsible/* .
