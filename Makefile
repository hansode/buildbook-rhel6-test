SHELL=/bin/bash

all:

setup:
	git submodule update --init --recursive

vendor/buildbook-rhel6:
	(cd vendor && git clone git@github.com:hansode/buildbook-rhel6.git)

test: setup
	sudo ./test-print.sh
