SHELL=/bin/bash

all:

setup:
	git submodule update --init --recursive

test: setup
	sudo ./test-print.sh
